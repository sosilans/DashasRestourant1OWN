<?php

use Illuminate\Support\Facades\Artisan;
use Illuminate\Foundation\Testing\RefreshDatabase;

it('renders home page', function () {
    $response = $this->get('/');
    $response->assertStatus(200);
});
