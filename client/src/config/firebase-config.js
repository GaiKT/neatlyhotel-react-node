import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth, onAuthStateChanged } from "firebase/auth";

const firebaseConfig = {
  apiKey: "AIzaSyCoM9gR96SlgwIqv4Sh9_gKylYBmL60JFM",
  authDomain: "neatlyhotel.firebaseapp.com",
  projectId: "neatlyhotel",
  storageBucket: "neatlyhotel.appspot.com",
  messagingSenderId: "409599105865",
  appId: "1:409599105865:web:dbb1b9d804cbb973ab9898"
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);

export { app, auth };
