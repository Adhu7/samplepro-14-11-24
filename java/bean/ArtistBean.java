package bean;

public class ArtistBean {
private int artistId;
private String name;
private String genre;
private String email;
private String phn;
public ArtistBean() {
	super();
}
public ArtistBean(int artistId, String name, String genre, String email, String phn) {
	super();
	this.artistId = artistId;
	this.name = name;
	this.genre = genre;
	this.email = email;
	this.phn = phn;
}
public int getArtistId() {
	return artistId;
}
public void setArtistId(int artistId) {
	this.artistId = artistId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getGenre() {
	return genre;
}
public void setGenre(String genre) {
	this.genre = genre;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhn() {
	return phn;
}
public void setPhn(String phn) {
	this.phn = phn;
}
@Override
public String toString() {
	return "ArtistBean [artistId=" + artistId + ", name=" + name + ", genre=" + genre + ", email=" + email + ", phn="
			+ phn + "]";
}

}
