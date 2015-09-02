@foreach($federal_reps as $federal_rep)
    <option value="{{ $federal_rep->federal_constituency_id }}">{{  $federal_rep->federal_constituency }}</option>
@endforeach