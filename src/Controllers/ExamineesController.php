<?php 

namespace App\Controllers;

use App\Models\UserAnswer;
use App\Models\User;

class ExamineesController extends BaseController
{
    public function index() {
        $this->initializeSession();

        $userObj = new User();
        $examinees = $userObj->getAllUsers();

        $userAnsObj = new UserAnswer();
        $data = $userAnsObj->getUserAnswers();

        $combinedData = [
            'examinees' => $examinees,
            'data' => $data, // Assuming this is also an array
        ];

        return $this->render('examinees', $combinedData);
    }
}