<?php

namespace App\Http\Controllers;

use App\Models\Legislative\FederalConstituency;
use App\Models\Legislative\SenatorialDistrict;
use App\Models\Lga;

use App\Http\Requests;
use App\Models\Legislative\StateConstituency;

class ListBoxController extends Controller
{
    /**
     * Get the local government areas based on the state id
     * @param int $id
     * @return Response
     */
    public function lga($id)
    {
        $lgas = Lga::where('state_id', $id)->orderBy('lga')->get();

        return view('partials.lga')->with([
            'lgas' => $lgas
        ]);
    }

    /**
     * Get Senatorial Districts Based on the state id
     * @param int $id
     * @return Response
     */
    public function district($id)
    {
        $districts = SenatorialDistrict::where('state_id', $id)->orderBy('senatorial_district')->get();

        return view('partials.district')->with(['districts' => $districts]);
    }

    /**
     * Get Federal Representatives Based on the state id
     * @param int $id
     * @return Response
     */
    public function federal_reps($id)
    {
        $federal_reps = FederalConstituency::where('state_id', $id)->orderBy('federal_constituency')->get();

        return view('partials.federal_reps')->with(['federal_reps' => $federal_reps]);
    }

    /**
     * Get State Representatives Based on the state id
     * @param int $id
     * @return Response
     */
    public function state_reps($id)
    {
        $state_reps = StateConstituency::where('state_id', $id)->orderBy('state_constituency')->get();

        return view('partials.state_reps')->with(['state_reps' => $state_reps]);
    }
}
