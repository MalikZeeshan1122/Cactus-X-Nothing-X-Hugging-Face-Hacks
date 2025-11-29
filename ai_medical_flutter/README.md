AI Medical Assistant - Flutter client (scaffold)

Overview
This is a minimal Flutter scaffold for the AI Medical Assistant mobile client. It includes simple demo screens for:
- Login (demo)
- AI Chat (connects to an AI gateway via POST)
- Symptom tracker (local, in-memory)
- Appointments (local, in-memory)

This scaffold is intended as a starting point. It does not include production-ready authentication/storage. Use Supabase (supabase_flutter) if you want persistent backend integration.

Quick start
1. Change to the app folder:

```powershell
cd ai_medical_flutter
```

2. Copy the environment example and fill in your values:

```powershell
copy .env.example .env
# edit .env to add AI_GATEWAY_URL and keys
```

3. Get packages and run:

```powershell
flutter pub get
flutter run
```

Configuration
- `AI_GATEWAY_URL` should point to a POST endpoint that accepts JSON {"prompt":"..."} and returns {"response":"..."}.
- Optionally provide `AI_API_KEY` if your gateway needs authorization.

Next steps (recommended)
- Integrate Supabase for auth and data storage
- Implement streaming responses for chat
- Add proper error handling, offline caching, and data migrations
- Add tests and CI for builds

Files added
- `lib/main.dart` - app entry and routes
- `lib/pages/*` - simple pages
- `lib/services/ai_service.dart` - placeholder API client
- `.env.example` - env variables template
- `pubspec.yaml` - dependencies

If you want, I can:
- Integrate Supabase auth/login flows
- Wire up real AI integrations (OpenAI/Google) with templates
- Add persistent local storage (Hive/SQLite)
- Build and produce an APK

Tell me which of the above you'd like next.