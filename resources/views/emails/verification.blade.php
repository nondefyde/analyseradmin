@extends('partials.emails')

@section('title', 'Verification Mail')

@section('content')

<h3>Hi, <strong><i>{{ $user->fullNames() }}</i></strong></h3>
<div class="lead" style="margin-bottom: 10px; font-weight: normal; font-size:17px; line-height:1.6;">
    <?php $content = explode("\n", $content); ?>
    @foreach($content as $line)
        <p>{!! $line !!}</p>
    @endforeach
    <a href="http://{{ env('DOMAIN_URL') }}/auth/verify/{{ $hashIds->encode($user->user_id) }}/{{ $user->verification_code }}">Verify</a>
</div>

@endsection
