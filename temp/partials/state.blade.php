<hr>
<div class="form-group">
    <label class="col-md-4 control-label">State</label>

    <div class="col-md-4">
        <select class="form-control select" name="hansard_state" id="hansard_state">
            <option value="0">Nothing Selected</option>
            @foreach($states as $state)
                <option value="{{ $state->state_id }}">{{ $state->state }}</option>
            @endforeach
        </select>
    </div>
</div>