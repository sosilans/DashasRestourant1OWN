<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class SiteBlock extends Model
{
    use HasFactory;
    protected $fillable = ['key','enabled','sort','json_content'];
    protected $casts = [
        'enabled' => 'boolean',
        'json_content' => 'array',
    ];
}
