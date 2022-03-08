package com.devpro.shop15.services;

import com.devpro.shop15.DTO.CategorySearchModel;
import com.devpro.shop15.DTO.ProductSearchModel;
import com.devpro.shop15.constants.Constants;
import com.devpro.shop15.entity.Categories;
import com.devpro.shop15.entity.Products;
import com.devpro.shop15.entity.ProductsImages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ProductService extends BaseService<Products> implements Constants {
    @Autowired
    private ProductImagesService productImagesService;

    @Override
    protected Class<Products> clazz() {
        return Products.class;
    }

    private boolean isEmptyUploadFile(MultipartFile[] images) {
        if (images == null || images.length <= 0)
            return true;

        if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
            return true;

        return false;
    }

    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }

    /*
     * Dùng để thêm mới sản phẩm
     *
     * @param p
     * @param productAvatar
     * @param productPictures
     * @throws IOException
     * @throws IllegalStateException
     */
    @Transactional
    public Products add(Products p, MultipartFile productAvatar, MultipartFile[] productPictures)
            throws IllegalStateException, IOException {

        // kiểm tra xem admin có đẩy avatar lên không ???
        if (!isEmptyUploadFile(productAvatar)) {
            // tạo đường dẫn tới folder chứa avatar
            String pathToFile = UPLOAD_FOLDER_ROOT + "products/avatars/" + productAvatar.getOriginalFilename();

            // lưu avatar vào đường dẫn trên
            productAvatar.transferTo(new File(pathToFile));

            p.setAvatar("products/avatars/" + productAvatar.getOriginalFilename());
        }

        // có đẩy pictures(product_images) ???
        if (!isEmptyUploadFile(productPictures)) {

            // nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
            for (MultipartFile pic : productPictures) {
                // lưu ảnh admin đẩy lên vào server
                pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "products/pictures/" + pic.getOriginalFilename()));

                // tạo mới 1 bản ghi product_images
                ProductsImages pi = new ProductsImages();
                pi.setPath("products/pictures/" + pic.getOriginalFilename());
                pi.setTitle(pic.getOriginalFilename());

                p.addProductImg(pi);
            }
        }
        //add seo
        p.setSeo(Utilities.slugify(p.getTitle()));
        // lưu vào database
        return super.saveOrUpdate(p);
    }

    /*
     * Cập nhật sản phẩm
     * @param productAvatar
     * @param productPictures
     */
    @Transactional
    public Products update(Products p, MultipartFile productAvatar, MultipartFile[] productPictures) throws IllegalStateException, IOException {
        // lấy thông tin cũ của product theo id
        Products productInDb = super.getById(p.getId());

        // có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
        if (!isEmptyUploadFile(productAvatar)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FOLDER_ROOT + productInDb.getAvatar()).delete();

            // add avartar moi
            productAvatar
                    .transferTo(new File(UPLOAD_FOLDER_ROOT + "products/avatars/" + productAvatar.getOriginalFilename()));
            p.setAvatar("products/avatars/" + productAvatar.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            p.setAvatar(productInDb.getAvatar());
        }

        // có đẩy pictures ???
        if (!isEmptyUploadFile(productPictures)) {

            // xóa pictures cũ
            if (productInDb.getProductsImages() != null && productInDb.getProductsImages().size() > 0) {
                for (ProductsImages opi : productInDb.getProductsImages()) {
                    // xóa avatar trong folder lên
                    new File(UPLOAD_FOLDER_ROOT + opi.getPath()).delete();

                    productImagesService.delete(opi);
                }
            }

            // thêm pictures mới
            for (MultipartFile pic : productPictures) {
                pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "products/pictures/" + pic.getOriginalFilename()));

                ProductsImages pi = new ProductsImages();
                pi.setPath("products/pictures/" + pic.getOriginalFilename());
                pi.setTitle(pic.getOriginalFilename());

                p.addProductImg(pi);
            }
        }
        //add seo
        p.setSeo(Utilities.slugify(p.getTitle()));

        // lưu vào database
        return super.saveOrUpdate(p);
    }

    public PagerData<Products> search(ProductSearchModel searchModel, int size) {
        //Khởi tạo sql
        String sql = "SELECT * FROM tbl_products c WHERE 1=1 ";
        if (searchModel != null) {
            //Tim Kiếm Theo Category
            if (searchModel.getCategoryId() != null) {
                sql += " and c.category_id = " + searchModel.getCategoryId();
            }
            //Check sản phẩm có Sale hay không
            if (searchModel.getPriceSale() != null) {
                if (searchModel.getPriceSale() == false) {
                    sql += "and c.price_sale is null and status = true";
                } else if (searchModel.getPriceSale() == true) {
                    sql += "and c.price_sale is not null and status = true";
                }
            }
            if (searchModel.getPriceStart() != null && searchModel.getPriceEnd() != null){
                sql += " and c.price between "+searchModel.getPriceStart()+" and "+searchModel.getPriceEnd();
            }
            //Tìm kiếm theo SEO => Cho Products
            if (!StringUtils.isEmpty(searchModel.getSeo())) {
                sql += "and c.seo = '" + searchModel.getSeo() + "'";
            }
            //Tìm kiếm theo hot
            if (searchModel.getIsHot() != null) {
                sql += "and c.is_hot = " + searchModel.getIsHot() + " and status = true";
            }
            //Tìm kiếm theo search Text

            if (!StringUtils.isEmpty(searchModel.getKeyword()) || searchModel.getKeyword() != null) {
                sql += " and (c.title like '%" + searchModel.getKeyword() + "%')";
            }

        }
        //Chỉ lấy sản phẩm chưa xóa
        //sql + = p.status =1
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage(), size);
    }

    public List<Products> getSearch(String keyword){
        String sql = "SELECT * FROM tbl_products c WHERE c.title like '%" + keyword + "%'";
        return runTransactQuerySQL(sql, 0, 0).getData();

    }
    //Get by category
    public List<Products> getByCategory(Integer category){
        String sql = "SELECT * FROM tbl_products c WHERE c.category_id = " +category;
        return runTransactQuerySQL(sql,0,0).getData();
    }

}
