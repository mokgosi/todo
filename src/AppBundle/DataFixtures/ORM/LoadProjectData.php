<?php

namespace AppBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use AppBundle\Entity\Project;

class LoadProjectData  extends AbstractFixture  implements OrderedFixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        foreach (range(1, 2) as $s) {
            $project = new Project();
            $project->setName('Project'.$s);
            $project->setDescription('Some project description goes here.');
            $project->setCreatedAt(new \DateTime('now'));
            $project->setUpdatedAt(new \DateTime('now'));
            $date = new \DateTime('now');
            $duedate = $date->add(new \DateInterval('P30D')); 
            $project->setDueDate($duedate);
            $project->setStatus('Pending');
            $manager->persist($project);
            
            $this->addReference('project'.$s, $project);
        }
        $manager->flush();
        
        $this->addReference('project', $project);
    }
    
    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }
}
