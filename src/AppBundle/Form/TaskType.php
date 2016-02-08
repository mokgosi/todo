<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TaskType extends AbstractType
{

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
                ->add('project', 'entity', array(
                    'class' => 'AppBundle:Project',
                    'property' => 'name'))
                ->add('name')
                ->add('status', 'choice', array(
                    'choices' => array(
                        'Pending' => 'Pending',
                        'InProgress' => 'In Progress',
                        'Completed' => 'Completed',
                        'Testing' => 'Testing',
                        'Approved' => 'Approved',
                        'Rejected' => 'Rejected',
                    ),
                ))
                ->add('description','textarea')
                ->add('dueDate', 'datetime', array(
                    'widget' => 'single_text',
                ))
                ->add('submit', 'submit')
        ;
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Task'
        ));
    }

}
