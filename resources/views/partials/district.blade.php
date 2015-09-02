@foreach($districts as $district)
    <option value="{{ $district->senatorial_district_id }}">{{  $district->senatorial_district }}</option>
@endforeach