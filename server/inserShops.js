require('dotenv').config();
const mongoose = require('mongoose');
const Shop = require('/Users/aymericsaves/development/wheretoshop/server/models/shops.js'); // Assurez-vous de remplacer par le chemin correct vers votre modèle Shop

// Connexion à MongoDB
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

// Données du shop à ajouter
const newShop = new Shop({
    name: "Shinzo",
    description: "Description du Shop",
    style: ["streetwear"],
    type: ["En ligne", "Physique"],
    address: "39 Rue Étienne Marcel, 75001",
    gps: {
      type: "Point",
      coordinates: [48.8645559, 2.3457531] // Remplacez par les coordonnées réelles
    },
    imageUrl: "https://lh5.googleusercontent.com/p/AF1QipPhUPyFJkZMcBHr-TrCjY08Tcb6-OqP7OW86tmn=w243-h174-n-k-no-nu",
    contact: {
        email: "email@shop.com",
        phone: "0123456789"
    },
    openingHours: "11h-10h"
});

// Sauvegarde du shop dans la base de données
async function saveShop() {
    try {
        const savedShop = await newShop.save();
        console.log("Shop créé avec succès :", savedShop);
    } catch (err) {
        console.error("Erreur lors de la création du shop :", err);
    } finally {
        mongoose.connection.close();
    }
}

// Exécution de la fonction pour sauvegarder le shop
saveShop();