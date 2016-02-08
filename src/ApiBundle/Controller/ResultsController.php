<?php

namespace ApiBundle\Controller;

use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Request\ParamFetcher;
use FOS\RestBundle\Controller\Annotations\QueryParam;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;

class ResultsController extends FOSRestController {

    /**
     * This is the documentation description of your method, it will appear
     * on a specific pane. It will read all the text until the first
     * annotation.
     *
     * @ApiDoc(
     *   resource=true,
     *   description="This is a description of your API method."
     * )
     * @QueryParam(name="limit", requirements="\d+", default="10", description="Search query string.")
     * @QueryParam(name="search", requirements="[a-z0-9 ]+", nullable=false, description="Search query string.")
     * 
     * @param ParamFetcher $paramFetcher
     */
    public function getResultsAction(ParamFetcher $paramFetcher) {
        $search = $paramFetcher->get('search');
        $limit = $paramFetcher->get('limit');
        $data = array("hello" => $search,"limit" => $limit);
        $view = $this->view($data);
        return $this->handleView($view);
    }

}
