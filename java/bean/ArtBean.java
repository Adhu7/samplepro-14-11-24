package bean;

public class ArtBean {
private int artId;
private String artTitle;
private String artistName;
private String artGenre;
private double artPrice;
private String uploadImage;
public ArtBean() {
	super();
}
public ArtBean(int artId, String artTitle, String artistName, String artGenre, double artPrice, String uploadImage) {
	super();
	this.artId = artId;
	this.artTitle = artTitle;
	this.artistName = artistName;
	this.artGenre = artGenre;
	this.artPrice = artPrice;
	this.uploadImage = uploadImage;
}
public ArtBean(String artTitle, String artistName, String artGenre, double artPrice, String uploadImage) {
	super();
	this.artTitle = artTitle;
	this.artistName = artistName;
	this.artGenre = artGenre;
	this.artPrice = artPrice;
	this.uploadImage = uploadImage;
}
public int getArtId() {
	return artId;
}
public void setArtId(int artId) {
	this.artId = artId;
}
public String getArtTitle() {
	return artTitle;
}
public void setArtTitle(String artTitle) {
	this.artTitle = artTitle;
}
public String getArtistName() {
	return artistName;
}
public void setArtistName(String artistName) {
	this.artistName = artistName;
}
public String getArtGenre() {
	return artGenre;
}
public void setArtGenre(String artGenre) {
	this.artGenre = artGenre;
}
public double getArtPrice() {
	return artPrice;
}
public void setArtPrice(double artPrice) {
	this.artPrice = artPrice;
}
public String getUploadImage() {
	return uploadImage;
}
public void setUploadImage(String uploadImage) {
	this.uploadImage = uploadImage;
}
@Override
public String toString() {
	return "ArtBean [artId=" + artId + ", artTitle=" + artTitle + ", artistName=" + artistName + ", artGenre="
			+ artGenre + ", artPrice=" + artPrice + ", uploadImage=" + uploadImage + "]";
}

}
