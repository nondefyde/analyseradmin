<?php

namespace App\Http\Controllers;

use App\Models\Like;
use App\Models\Projects\ProjectComment;
use App\Models\State;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Response;

class ApiController extends Controller
{
    /**
     * users comments on project updates
     * @param Request $request
     * @return Response
     */
    public function projectComment(Request $request)
    {
        $inputs = $request->all();
        $comment = ProjectComment::create($inputs);
        dd($inputs);
    }

    /**
     * when a user likes or dislikes a project
     * @param Request $request
     * @return Response
     */
    public function projectGestures(Request $request)
    {
        $inputs = $request->all();
        $gesture = Like::create($inputs);
    }

    public function getAssembly($id){

        $states = State::all();

        if($id === '1'){
            return view('hansards.partials.national', compact('states'));
        }else if($id === '2'){
            return view('hansards.partials.state', compact('states'));
        }else{
            return '';
        }
    }

}
