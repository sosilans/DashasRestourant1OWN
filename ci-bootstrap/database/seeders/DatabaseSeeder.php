<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\{MenuItem,BusinessHour,SiteBlock,User};
use Spatie\Permission\Models\Role;
class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Roles
        $adminRole = Role::firstOrCreate(['name' => 'admin']);
        $userRole  = Role::firstOrCreate(['name' => 'user']);
        // Admin user
        $email = env('ADMIN_EMAIL', 'admin@example.com');
        $admin = User::firstOrCreate(
            ['email' => $email],
            [
                'name' => 'Admin',
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
                'remember_token' => Str::random(10),
            ]
        );
        if (!$admin->hasRole('admin')) { $admin->assignRole($adminRole); }
        // Site blocks
        SiteBlock::updateOrCreate(['key' => 'about'], [
            'enabled' => true,
            'sort' => 10,
            'json_content' => ['title' => 'Our Story'],
        ]);
        SiteBlock::updateOrCreate(['key' => 'menu'], [
            'enabled' => true,
            'sort' => 20,
            'json_content' => ['title' => 'Featured Menu'],
        ]);
        // Menu items
        $items = [
            ['name' => 'Tagliatelle al Ragù', 'description' => 'Slow‑cooked beef ragù, Parmigiano Reggiano.', 'price_decimal' => 18, 'emoji' => '🍝', 'sort' => 10],
            ['name' => 'Margherita Pizza',    'description' => 'San Marzano tomatoes, fior di latte, basil.', 'price_decimal' => 16, 'emoji' => '🍕', 'sort' => 20],
            ['name' => 'Risotto ai Funghi',   'description' => 'Carnaroli rice, wild mushrooms, pecorino.',   'price_decimal' => 21, 'emoji' => '🍄', 'sort' => 30],
            ['name' => 'Tiramisu',            'description' => 'Espresso‑soaked savoiardi, mascarpone cream.', 'price_decimal' => 9,  'emoji' => '🍰', 'sort' => 40],
        ];
        foreach ($items as $i) { MenuItem::updateOrCreate(['name' => $i['name']], $i); }
        // Hours (0=Sun)
        $hours = [
            ['day'=>1,'open_time'=>'12:00:00','close_time'=>'22:00:00'],
            ['day'=>2,'open_time'=>'12:00:00','close_time'=>'22:00:00'],
            ['day'=>3,'open_time'=>'12:00:00','close_time'=>'22:00:00'],
            ['day'=>4,'open_time'=>'12:00:00','close_time'=>'23:00:00'],
            ['day'=>5,'open_time'=>'12:00:00','close_time'=>'23:00:00'],
            ['day'=>6,'open_time'=>'12:00:00','close_time'=>'21:00:00'],
        ];
        foreach ($hours as $h) { BusinessHour::updateOrCreate(['day'=>$h['day']], $h); }
    }
}
