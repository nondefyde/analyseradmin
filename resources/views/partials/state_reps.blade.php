@foreach($state_reps as $state_rep)
    <option value="{{ $state_rep->state_constituency_id }}">{{  $state_rep->state_constituency }}</option>
@endforeach