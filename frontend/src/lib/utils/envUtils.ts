// // Build-time public env (safe in browser)
// import {
//     PUBLIC_MEDIA_BASE_DEV,
//     PUBLIC_MEDIA_BASE_PROD,
// } from '$env/static/public';

// import { env as publicEnv } from '$env/dynamic/public';


import { env as publicEnv } from '$env/dynamic/public';

const MEDIA_BASE = publicEnv.PUBLIC_IMAGE_BASE_URL

