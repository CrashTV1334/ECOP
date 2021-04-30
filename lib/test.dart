// Map data = <String, String>{
//   "Adhar": "123456789100",
//   "Password" : "12345",
//   "Name" : "Testing",
//   "Mobile" : "1234567890"
// };
//
// var resp = await http.post(
// Uri.parse("http://ecopdbms.000webhostapp.com/RegisterUser.php"),
// body: data,
// );
// print(resp.body);
// Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
// print(res["error"]);

// Scaffold(
// body: Container(
// width: Width,
// height: Height,
// child: Center(
// child: Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(
// child: Text("Login",style: TextStyle(
// fontSize: 40,
// fontWeight: FontWeight.bold,
// fontStyle: FontStyle.italic
// ),),
// ),
// SizedBox(height: 20,),
// Form("AdharCard Number/ID", controller),
// SizedBox(height: 20,),
// Form("Password", controller),
// SizedBox(height: 20,),
// Row(
// mainAxisSize: MainAxisSize.max,
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// TextButton(
// onPressed: (){
//
// },
// child: Container(
// padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.blue,
// ),
// child: Text("Login",style: TextStyle(
// color: Colors.white,
// fontSize: 20
// ),)
// ),
// ),
// TextButton(
// onPressed: (){
// Navigator.popAndPushNamed(context, LoginRouteCode);
// },
// child: Container(
// padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.blue,
// ),
// child: Text("Register",style: TextStyle(
// color: Colors.white,
// fontSize: 20
// ),)
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// );