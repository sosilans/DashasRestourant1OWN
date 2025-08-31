<?php
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

it(''renders home page'', function () {
    $response = $this->get('/');
    $response->assertStatus(200);
});
