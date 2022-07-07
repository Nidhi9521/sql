import * as admin from 'firebase-admin';
import cre from '../nodejsauth-f12ae-firebase-adminsdk-e4myk-e352533acb.json';
import jwt_decode from 'jwt-decode';

function verifyToken(req: any, res: any,next:any) {

    var token: any = req.headers['token'];
    let decoded: any = jwt_decode(token);
    console.log(decoded.email);
    admin.initializeApp(
        {
            credential: admin.credential.cert(JSON.parse(JSON.stringify(cre)))
        }
    );
    admin.auth().verifyIdToken(token).then((decodedToken) => {
        let email: any = decodedToken.email;
        console.log(email);
        let uid: any =decodedToken.uid;
        console.log(uid);
        console.log(decodedToken);
        next();
    }
    ).catch((error) => {
        console.log(error);
        let errorData={
            message:error.message,
            expiredAt:error.expiredAt
        };
        res.send(errorData);
        return res.status(401).json({
            message:'Unauthorized Access'
        });
    });


}

export{verifyToken};