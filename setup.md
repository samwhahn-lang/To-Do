# Private To-Do List Setup Guide

## Architecture
- **Public Code**: Hosted on GitHub (safe to share)
- **Private Data**: Stored in Supabase database (only you can access)
- **Sync**: Works across all devices automatically

## Step 1: Set Up Supabase (Free)

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Click "New Project"
3. Fill in:
   - **Project Name**: `private-todo-list`
   - **Database Password**: (create a strong password - save it!)
   - **Region**: Choose closest to you
4. Wait ~2 minutes for the project to set up

## Step 2: Create Database Tables

1. In your Supabase project, click **SQL Editor** in the left sidebar
2. Click **New Query**
3. Copy and paste this SQL code:

```sql
-- Create sections table (your custom categories)
create table sections (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users not null,
  name text not null,
  order_index integer not null default 0,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create tasks table (your to-do items)
create table tasks (
  id uuid default gen_random_uuid() primary key,
  section_id uuid references sections(id) on delete cascade not null,
  user_id uuid references auth.users not null,
  text text not null,
  completed boolean default false,
  is_repeating boolean default false,
  date date not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable Row Level Security (RLS) - This keeps your data PRIVATE
alter table sections enable row level security;
alter table tasks enable row level security;

-- Users can only see their own sections
create policy "Users can view their own sections"
  on sections for select
  using (auth.uid() = user_id);

create policy "Users can insert their own sections"
  on sections for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own sections"
  on sections for update
  using (auth.uid() = user_id);

create policy "Users can delete their own sections"
  on sections for delete
  using (auth.uid() = user_id);

-- Users can only see their own tasks
create policy "Users can view their own tasks"
  on tasks for select
  using (auth.uid() = user_id);

create policy "Users can insert their own tasks"
  on tasks for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own tasks"
  on tasks for update
  using (auth.uid() = user_id);

create policy "Users can delete their own tasks"
  on tasks for delete
  using (auth.uid() = user_id);

-- Create indexes for better performance
create index sections_user_id_idx on sections(user_id);
create index tasks_user_id_idx on tasks(user_id);
create index tasks_date_idx on tasks(date);
create index tasks_section_id_idx on tasks(section_id);
```

4. Click **Run** (or press Ctrl/Cmd + Enter)
5. You should see "Success. No rows returned"

## Step 3: Get Your API Credentials

1. In Supabase, click **Project Settings** (gear icon in sidebar)
2. Click **API** in the left menu
3. You'll see two important values:
   - **Project URL**: Something like `https://abcdefgh.supabase.co`
   - **anon public key**: A long string starting with `eyJ...`
4. **COPY THESE VALUES** - you'll need them next!

## Step 4: Configure the App

1. Open `todo-app.html` in a text editor
2. Find these lines (around line 313):
```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```
3. Replace with your actual values:
```javascript
const SUPABASE_URL = 'https://abcdefgh.supabase.co';  // Your Project URL
const SUPABASE_ANON_KEY = 'eyJ...';  // Your anon public key
```
4. Save the file

## Step 5: Test Locally

1. Open `todo-app.html` in your web browser (double-click the file)
2. Sign up with your email and password
3. Check your email for a confirmation link (check spam!)
4. Click the confirmation link
5. Log back in to the app
6. Create your first section and add tasks!

## Step 6: Deploy to GitHub (Code Public, Data Private)

1. Create a new repository on GitHub
2. Make it **public** (the code is safe to share)
3. Upload these files:
   - `todo-app.html`
   - `README.md` (this file)
   - `LICENSE` (optional)

4. Enable GitHub Pages:
   - Go to Settings > Pages
   - Source: Deploy from a branch
   - Branch: main / root
   - Click Save

5. Your app will be live at: `https://yourusername.github.io/todo-app/todo-app.html`

## Privacy & Security ✅

**What's Public:**
- ✅ The code on GitHub (HTML/CSS/JavaScript)
- ✅ Your Supabase project URL
- ✅ Your anon public key (safe to expose)

**What's Private:**
- 🔒 Your actual to-do items and tasks
- 🔒 Your user credentials
- 🔒 Your database password
- 🔒 Nobody can access your data without your login

**How Row Level Security Works:**
- Each user can ONLY see/edit their own data
- Even if someone gets your API keys, they can't see your tasks
- Supabase enforces this at the database level

## Features

✅ **User-defined sections** - Create custom categories (Work, Personal, etc.)  
✅ **Daily repeating tasks** - Mark tasks to repeat every day  
✅ **Date display** - Shows current date at top  
✅ **Auto-archiving** - Completed tasks are tracked by date  
✅ **Cross-device sync** - Access from phone, tablet, computer  
✅ **Private & secure** - Only you can see your data  

## Daily Workflow

1. Open the app each morning
2. Your sections and repeating tasks automatically appear
3. Add new one-off tasks as needed
4. Check off tasks as you complete them
5. Data syncs instantly across all devices

## Advanced: Automatic Daily Reset (Optional)

If you want repeating tasks to automatically reset each day:

1. In Supabase, go to **Database > Functions**
2. Create a new function called `reset_daily_tasks`
3. Use SQL to copy repeating tasks to today's date
4. Set up a cron job to run it daily at midnight

(I can help you set this up if needed!)

## Troubleshooting

**"Invalid API key" error:**
- Double-check you copied the full anon key from Supabase

**Can't log in:**
- Check your email for confirmation link
- Make sure you confirmed your account

**Tasks not syncing:**
- Check your internet connection
- Open browser console (F12) to see any errors

**Need help?**
- Supabase Docs: https://supabase.com/docs
- Contact me with questions!
