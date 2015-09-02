<?php

namespace App\Http\Controllers;

use App\User;
use DataSift_StreamConsumer;
use DataSift_User;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getIndex()
    {
        // Create a client
        return view('dashboard.index', compact('client'));
    }
}

