# 🔒 Private To-Do List

A daily task management app with **private data storage** and **cross-device sync**.

## Features

- ✅ **User-defined sections** - Create custom categories for organizing tasks
- ✅ **Repeating daily tasks** - Mark tasks to appear automatically each day
- ✅ **Date-based archiving** - All completed tasks tracked by date
- ✅ **Cross-device sync** - Access from phone, tablet, or computer
- ✅ **Private & secure** - Your data is encrypted and only accessible by you
- ✅ **Offline-ready** - Works even without internet

## Privacy Model

**Public (GitHub):**
- ✅ Application code (HTML/CSS/JavaScript)
- ✅ Setup instructions
- ✅ Documentation

**Private (Supabase Database):**
- 🔒 Your to-do items and tasks
- 🔒 Your sections and categories
- 🔒 Your user credentials
- 🔒 All personal data

**How it works:** The code is open source, but your actual task data is stored in a private Supabase database with Row Level Security (RLS) enabled. Only you can access your data.

## Quick Start

1. **Set up Supabase** (free account)
   - Create a new project at [supabase.com](https://supabase.com)
   - Run the SQL schema (see SETUP.md)
   - Get your API credentials

2. **Configure the app**
   - Clone this repository
   - Add your Supabase URL and API key to `todo-app.html`

3. **Deploy**
   - Push to GitHub
   - Enable GitHub Pages
   - Access from anywhere!

📖 **Full setup instructions:** See [SETUP.md](./SETUP.md)

## Tech Stack

- **Frontend:** React (via CDN), vanilla JavaScript
- **Backend:** Supabase (PostgreSQL database + authentication)
- **Hosting:** GitHub Pages (static hosting)
- **Security:** Row Level Security (RLS) policies

## Screenshots

*(Add screenshots here after deployment)*

## Development

To run locally:
1. Configure Supabase credentials in `todo-app.html`
2. Open `todo-app.html` in your browser
3. Sign up and start using!

## License

MIT License - See LICENSE file for details

## Support

Questions? Issues? Open a GitHub issue or reach out!
