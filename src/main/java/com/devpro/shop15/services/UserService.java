package com.devpro.shop15.services;

import com.devpro.shop15.constants.Constants;
import com.devpro.shop15.entity.Products;
import com.devpro.shop15.entity.ProductsImages;
import com.devpro.shop15.entity.Users;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class UserService extends BaseService<Users> implements Constants {


    @Override
    protected Class<Users> clazz() {
        return Users.class;
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
     * Cập nhật sản phẩm
     * @param productAvatar
     * @param productPictures
     */
    @Transactional
    public Users update(Users users, MultipartFile imageUser) throws IllegalStateException, IOException {
        // lấy thông tin cũ của product theo id
        Users userInDb = super.getById(users.getId());

        // có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
        if (!isEmptyUploadFile(imageUser)) {
            // xóa avatar trong folder lên
            new File(UPLOAD_FOLDER_ROOT + userInDb.getImgUser()).delete();

            // add avartar moi
            imageUser
                    .transferTo(new File(UPLOAD_FOLDER_ROOT + "users/avatars/" + imageUser.getOriginalFilename()));
            users.setImgUser("users/avatars/" + imageUser.getOriginalFilename());
        } else {
            // su dung lai avatar cu
            users.setImgUser(userInDb.getImgUser());
        }

        // có đẩy pictures ???
        //add seo
        // lưu vào database
        if (users.getPassword() == null){
            users.setPassword(userInDb.getPassword());
        }
        if (users.getUsername() == null){
            users.setUsername(userInDb.getUsername());
        }
        return super.saveOrUpdate(users);
    }
    public Users loadUserByUsername(String username){
        String sql = "SELECT * FROM tbl_users where username = '"+username+"'";
        List<Users> usersList = this.runTransactQuerySQL(sql,0,0).getData();
        if (usersList==null || usersList.size()<=0) return null;
        return usersList.get(0);
    }
}
