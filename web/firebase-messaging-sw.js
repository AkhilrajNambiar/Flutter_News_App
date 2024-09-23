importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: 'AIzaSyDKgnmrYT2KNxDwVYMBFPlR1RuWFmITdV0',
    appId: '1:195202810605:web:6f47c19f4ea250d38fc2e4',
    messagingSenderId: '195202810605',
    projectId: 'news-feed-app-a41ed',
    authDomain: 'news-feed-app-a41ed.firebaseapp.com',
    storageBucket: 'news-feed-app-a41ed.appspot.com',
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log(Notification.permission);
  console.log("onBackgroundMessage", m);
  const notificationTitle = m.notification.title;
  const notificationOptions = {
    body: m.notification.body,
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});