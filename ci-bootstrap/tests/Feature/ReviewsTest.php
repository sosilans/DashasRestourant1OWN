<?php
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\User;

uses(RefreshDatabase::class);

it(''requires auth to submit reviews'', function () {
    $this->post('/reviews', ['body'=>'Great!','rating'=>5])->assertRedirect('/login');
});

it(''allows logged user to submit review pending'', function () {
    $user = User::factory()->create();
    $this->actingAs($user);
    $this->post('/reviews', ['body'=>'Great!','rating'=>5])->assertRedirect();
});
