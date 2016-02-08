<?php

namespace AppBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use AppBundle\Entity\Task;

class LoadTaskData  extends AbstractFixture  implements OrderedFixtureInterface
{
    
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager) {
        
        foreach (range(1, 2) as $s) {
            foreach (range(1, 5) as $i) {
                $task = new Task();
                $task->setProject($this->getReference('project'.$s));
                $task->setName('Project-'.($s).'-Task-'.($i));
                $task->setStatus('Pending');
                $task->setDescription('Some brief project description to go here.');
                $task->setUserId($s);
                $task->setCreatedAt(new \DateTime('now'));
                $task->setUpdatedAt(new \DateTime('now'));
                $date = new \DateTime('now');
                $duedate = $date->add(new \DateInterval('P30D')); 
                $task->setDueDate($duedate);
                $manager->persist($task);
            }
        }
        $manager->flush();
    }
    
    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 2; // the order in which fixtures will be loaded
    }
}
