# Environment Configuration

| Variable | Required | Used By | Public/Private | Purpose | Example |
| -------- | -------- | ------- | -------------- | ------- | ------- |
| `SUPABASE_URL` | Yes | Flutter/Sync | Public | Connects to the Supabase backend | `https://xyz.supabase.co` |
| `SUPABASE_ANON_KEY` | Yes | Flutter/Sync | Public | Authenticates public/anon requests to Supabase | `eyJhbGciOiJIUzI1Ni...` |
| `GEMINI_API_KEY` | Yes | Flutter/AI | Private | Used for local AI metadata assistance | `AIzaSyB...` |
| `GOOGLE_MAPS_API_KEY` | Yes | Flutter/Maps | Private | Used for Geofencing/Live Map | `AIzaSy...` |

## Security Rules
- NEVER commit `.env` to version control.
- `GEMINI_API_KEY` and `GOOGLE_MAPS_API_KEY` are currently stored client-side for academic/prototype purposes. In a production environment, these must be migrated to a backend proxy server to prevent extraction by rooted devices.
