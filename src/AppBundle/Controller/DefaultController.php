<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use AppBundle\Entity\Task;
use AppBundle\Form\TaskType;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     * @Security("has_role('ROLE_USER')") 
     * 
     * Roles ROLE_USER, ROLE_ADMIN
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $projects = $em->getRepository('AppBundle:Project')->getProjectAndTaskCount();
        
        $session = $this->get('session');
        $session->set('projects', $projects);

        $tasks = $em->getRepository('AppBundle:Task')->findAll();
        
        $task = new Task();
        $form = $this->createForm('AppBundle\Form\TaskType', $task);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $this->get('security.token_storage')->getToken()->getUser();
            $task->setUserId($user->getId());
            $em->persist($task);
            $em->flush();
            
            return $this->redirectToRoute('homepage');
        }
        
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', array(
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..'),
            'projects' => $projects,
            'tasks' => $tasks,
            'form' => $form->createView(),
        ));
    }
}
