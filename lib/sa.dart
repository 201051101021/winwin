   /*return FutureBuilder(
        future: _initializeApp,
        builder: (context, snapshot) {
          
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error:${snapshot.error}"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user == null) {
                    return LoginPage();
                  } 
                  if (user != null) {
                    return Home();
                  } 
            
                }
                return Scaffold(
                  body: Center(
                    child: Text("Checking Authentication....."),
                  ),
                );
              },
            );
          }
        });*/


           /* return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Home();
          }

          return LoginPage();
        });
  }
}*/
