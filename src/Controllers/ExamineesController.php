<?php 

namespace App\Controllers;

use App\Models\UserAnswer;
use App\Models\User;
use Fpdf\Fpdf;

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

    public function exportToPDF($attempt_id)
    {
        // Initialize Course object
        $obj = new UserAnswer();
        // Fetch attempt data for the specific attempt ID
        $data = $obj->exportData($attempt_id); // Fetch the single attempt data
        
        // Create an instance of FPDF
        $pdf = new FPDF();
        $pdf->AddPage();

        // Set PDF Title
        $pdf->SetFont('Arial', 'B', 16);
        $pdf->Cell(190, 10, 'Examinee Attempt Details', 0, 1, 'C');
        $pdf->Ln(10);

        // Add Examinee Information
        $pdf->SetFont('Arial', '', 12);
        $pdf->Cell(50, 10, 'Examinee Name: ' . $data['examinee_name'], 0, 1);
        $pdf->Cell(50, 10, 'Examinee Email: ' . $data['examinee_email'], 0, 1);
        $pdf->Cell(50, 10, 'Attempt Date: ' . $data['attempt_date'], 0, 1);
        $pdf->Cell(50, 10, 'Exam Items: ' . $data['exam_items'], 0, 1);
        $pdf->Cell(50, 10, 'Exam Score: ' . $data['exam_score'], 0, 1);
        $pdf->Ln(10); // Line break after examinee info

        // Add Answer Information
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->Cell(190, 10, 'Answers Submitted', 0, 1, 'C');
        $pdf->Ln(5);

        $pdf->SetFont('Arial', '', 12);
        $pdf->Cell(50, 10, 'Answer ID: ' . $data['answer_id'], 0, 1);
        $pdf->Cell(50, 10, 'Attempt ID: ' . $data['attempt_id'], 0, 1);
        $pdf->Cell(50, 10, 'Answers: ' . $data['answers'], 0, 1);
        $pdf->Cell(50, 10, 'Date Answered: ' . $data['date_answered'], 0, 1);
        $pdf->Ln(10); // Line break after answers section

        // Output the PDF as a download
        $pdf->Output('D', 'examinee_attempt_' . $attempt_id . '.pdf');
    }

}