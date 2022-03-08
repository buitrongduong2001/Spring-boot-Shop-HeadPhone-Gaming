package com.devpro.shop15.DTO;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO extends  BaseDTO{

	private String title;

	private BigDecimal price;

	private BigDecimal priceSale;

	private String shortDescription;

	private String detailDescription;

	private MultipartFile avatar;

	private Boolean isHot = Boolean.TRUE;

	private CategoriesDTO categories;

	private Set<ProductsImagesDTO> productsImages = new HashSet<>();

	public CategoriesDTO getCategories() {
		return categories;
	}

	public void setCategories(CategoriesDTO categories) {
		this.categories = categories;
	}

	public Set<ProductsImagesDTO> getProductsImages() {
		return productsImages;
	}

	public void setProductsImages(Set<ProductsImagesDTO> productsImages) {
		this.productsImages = productsImages;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public MultipartFile getAvatar() {
		return avatar;
	}

	public void setAvatar(MultipartFile avatar) {
		this.avatar = avatar;
	}

	public Boolean getHot() {
		return isHot;
	}

	public void setHot(Boolean hot) {
		isHot = hot;
	}


//	private Set<SaleOrderProducts> saleOrderProducts = new HashSet<>();
}
