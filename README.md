# Private To-Do List

A daily task management app with private Supabase data storage and cross-device sync.

## Features

- User-defined sections for organizing tasks
- Daily repeating tasks backed by templates
- One-time tasks for today's list
- Subtasks and task ordering
- Seven-day task history
- Cross-device sync through Supabase
- Offline-friendly local cache while the app reloads

## Privacy Model

**Public (GitHub):**
- Application code in `index.html`
- Setup instructions
- Documentation

**Private (Supabase Database):**
- Your to-do items and tasks
- Your sections and categories
- Your user credentials
- All personal task data

**How it works:** The code can be public, but your actual task data is stored in a private Supabase database with Row Level Security (RLS) enabled. Each signed-in user can only read and modify their own rows.

## Quick Start

1. **Set up Supabase** (free account)
   - Create a new project at [supabase.com](https://supabase.com)
   - Run the SQL schema (see `setup.md`)
   - Get your API credentials

2. **Configure the app**
   - Clone this repository
   - Add your Supabase URL and publishable key to `index.html`

3. **Deploy**
   - Push to GitHub
   - Enable GitHub Pages
   - Access from anywhere!

**Full setup instructions:** See [setup.md](./setup.md)

## Tech Stack

- **Frontend:** React via CDN, Babel Standalone, vanilla JavaScript
- **Backend:** Supabase PostgreSQL database and authentication
- **Hosting:** GitHub Pages or any static file host
- **Security:** Supabase Row Level Security policies

## Development

To run locally:
1. Configure Supabase credentials in `index.html`
2. Open `index.html` in your browser
3. Sign up and start using!

## License

No license file is currently included.

## Support

Questions? Issues? Open a GitHub issue or reach out!
