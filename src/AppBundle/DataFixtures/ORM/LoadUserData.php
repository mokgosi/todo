<?php

namespace AppBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\DataFixtures\AbstractFixture;

class LoadUserData  extends AbstractFixture implements FixtureInterface, ContainerAwareInterface,OrderedFixtureInterface
{
    /**
     * @var ContainerInterface
     */
    private $container;

    /**
     * {@inheritDoc}
     */
    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;
    }

    public function load(ObjectManager $manager)
    {
        // Get our userManager, you must implement `ContainerAwareInterface`
        $userManager = $this->container->get('fos_user.user_manager');

        // Create our user and set details
        $user = $userManager->createUser();
        $user->setUsername('admin');
        $user->setEmail('admin@domain.com');
        $user->setPlainPassword('admin');
        //$user->setPassword('3NCRYPT3D-V3R51ON');
        $user->setEnabled(true);
        $user->setRoles(array('ROLE_ADMIN'));

        // Update the user
        $userManager->updateUser($user, true);
        
        // Create our user and set details
        $user1 = $userManager->createUser();
        $user1->setUsername('user');
        $user1->setEmail('user@domain.com');
        $user1->setPlainPassword('user');
        //$user->setPassword('3NCRYPT3D-V3R51ON');
        $user1->setEnabled(true);
        $user1->setRoles(array('ROLE_USER'));

        // Update the user
        $userManager->updateUser($user1, true);
    }

    public function getOrder()
    {
        return 0; // the order in which fixtures will be loaded
    }

}
