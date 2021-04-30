class CopModel{
  String CopId;
  String Name;
  String Mobile;
  String Password;
  String Post;
  String StationPosted;
  String City;
  String PostalCode;

  thisdata(String copid, String name, String mobile, String password, String post, String startionposted,String city,String postalcode){
    this.CopId = copid;
    this.Name = name;
    this.Mobile = mobile;
    this.Password = password;
    this.Post = post;
    this.StationPosted = startionposted;
    this.City = city;
    this.PostalCode = postalcode;
  }
}