# Suno AI API

## Overview
This is a Next.js application that provides an API wrapper for the Suno AI music generation service. It allows you to integrate Suno.ai's music generation capabilities into your applications.

## Project Structure
- `src/app/` - Next.js App Router pages and API routes
  - `api/` - API endpoints for music generation, lyrics, and more
  - `components/` - React components (Header, Footer, Swagger docs, etc.)
  - `docs/` - Swagger API documentation page
- `src/lib/` - Utility functions and Suno API client
- `public/` - Static assets

## Tech Stack
- **Framework**: Next.js 14.1.4 with App Router
- **Styling**: Tailwind CSS
- **Language**: TypeScript
- **API Documentation**: Swagger UI

## Configuration
The application requires the following environment variables (see `.env.example`):
- `SUNO_COOKIE` - Authentication cookie from suno.ai
- `TWOCAPTCHA_KEY` - (Optional) API key from 2captcha.com for captcha solving
- `BROWSER` - Browser to use (chromium or firefox)
- `BROWSER_GHOST_CURSOR` - Enable ghost cursor (true/false)
- `BROWSER_LOCALE` - Browser locale
- `BROWSER_HEADLESS` - Run browser in headless mode (true/false)

## Development
- **Dev Server**: `npm run dev` (runs on port 5000)
- **Build**: `npm run build`
- **Start**: `npm run start`

## API Endpoints
- `/api/generate` - Generate music
- `/api/custom_generate` - Custom music generation
- `/api/generate_lyrics` - Generate lyrics
- `/api/extend_audio` - Extend existing audio
- `/api/get` - Get generation status
- `/api/get_limit` - Get usage limits
- `/api/clip` - Get clip information
- `/api/concat` - Concatenate audio clips
- `/docs` - Interactive API documentation

## Recent Changes
- 2026-01-15: Applied authentication fixes from kershey/suno-api-improved fork
  - Updated Clerk API URL from clerk.suno.com to auth.suno.com
  - Updated Clerk version from 5.15.0 to 5.117.0
  - Added proper API version parameter (2025-11-10)
  - Fixed cookie parsing to extract __client_uat from session-variant cookies
- 2026-01-15: Configured for Replit environment with port 5000
