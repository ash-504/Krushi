/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require("firebase-functions");

exports.helloWorld = functions.https.onCall((data, context) => {
  return `Hello, ${data.name || 'World'}!`;
});

const express = require("express");
const cors = require("cors");
const app = express();
app.use(cors());

const locations = require("./data/locations.json");

// ✅ Get all states
app.get("/states", (req, res) => {
  const states = locations.map(item => item.state);
  res.json(states);
});

// ✅ Get districts by state
app.get("/districts/:state", (req, res) => {
  const state = req.params.state.toLowerCase();
  const stateData = locations.find(s => s.state.toLowerCase() === state);
  if (!stateData) return res.status(404).json({ error: "State not found" });

  const districts = stateData.districts.map(d => d.district);
  res.json(districts);
});

// ✅ Get talukas by state and district
app.get("/talukas/:state/:district", (req, res) => {
  const { state, district } = req.params;
  const stateData = locations.find(s => s.state.toLowerCase() === state.toLowerCase());
  if (!stateData) return res.status(404).json({ error: "State not found" });

  const districtData = stateData.districts.find(d => d.district.toLowerCase() === district.toLowerCase());
  if (!districtData) return res.status(404).json({ error: "District not found" });

  const talukas = districtData.talukas.map(t => t.taluka);
  res.json(talukas);
});

// ✅ Get villages by state, district, and taluka
app.get("/villages/:state/:district/:taluka", (req, res) => {
  const { state, district, taluka } = req.params;
  const stateData = locations.find(s => s.state.toLowerCase() === state.toLowerCase());
  if (!stateData) return res.status(404).json({ error: "State not found" });

  const districtData = stateData.districts.find(d => d.district.toLowerCase() === district.toLowerCase());
  if (!districtData) return res.status(404).json({ error: "District not found" });

  const talukaData = districtData.talukas.find(t => t.taluka.toLowerCase() === taluka.toLowerCase());
  if (!talukaData) return res.status(404).json({ error: "Taluka not found" });

  res.json(talukaData.villages);
});

// ✅ Export API
exports.addressAPI = functions.https.onRequest(app);
