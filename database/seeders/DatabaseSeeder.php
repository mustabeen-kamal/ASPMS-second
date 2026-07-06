<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Role;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
{
    Role::insert([
        ['id' => (string) Str::uuid(), 'name' => 'admin'],
        ['id' => (string) Str::uuid(), 'name' => 'faculty'],
        ['id' => (string) Str::uuid(), 'name' => 'student'],
    ]);
}
}
