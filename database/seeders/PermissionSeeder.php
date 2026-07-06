<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionSeeder extends Seeder
{
    
    public function run(): void
    {
        Permission::firstOrCreate(['name'=>'users.view']);
        Permission::firstOrCreate(['name'=>'users.create']);
        Permission::firstOrCreate(['name'=>'users.update']);
        Permission::firstOrCreate(['name'=>'users.delete']);
        $admin = Role::findByName('Admin');
        $admin->givePermissionTo(Permission::all());
    
    }
}
