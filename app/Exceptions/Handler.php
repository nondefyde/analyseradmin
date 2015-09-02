<?php

namespace App\Exceptions;

use Exception;
use Symfony\Component\HttpFoundation\File\Exception\FileNotFoundException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that should not be reported.
     *
     * @var array
     */
    protected $dontReport = [
        HttpException::class,
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Exception  $e
     * @return void
     */
    public function report(Exception $e)
    {
        return parent::report($e);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $e
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $e)
    {
        ////////////////////////////////////////////////// starts: KHEENGZ CUSTOME CODE ///////////////////////////////////////
        //Invalid Record Request Exception
        if ($e instanceof ModelNotFoundException) {
            return response()->view('errors.custom', [
                'code'=>'304.1',
                'header'=>'Invalid Record Request',
                'message'=>'The Record You Are Looking For Does Not Exist'
            ]);
        }
        //File For Download Not Found Exception
        if ($e instanceof FileNotFoundException){
            return response()->view('errors.custom', [
                'code'=>'501.4',
                'header'=>'File Not Found',
                'message'=>'The File You Are Looking For Or Trying To Download Does Not Exist On Our Server'
            ]);
        }
        ////////////////////////////////////////////////// end: KHEENGZ CUSTOME CODE ///////////////////////////////////////

        return parent::render($request, $e);
    }
}
