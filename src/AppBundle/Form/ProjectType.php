<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProjectType extends AbstractType
{

    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
                ->add('name', 'text')
                ->add('description', 'textarea')
                ->add('dueDate', 'datetime', array(
                    'widget' => 'single_text',
                ))
                ->add('submit', 'submit')
                ->add('status', 'choice', array(
                    'choices' => array(
                        'Pending' => 'Pending',
                        'Completed' => 'Completed',
                        'Testing' => 'Testing',
                        'Approved' => 'Approved',
                        'Rejected' => 'Rejected',
                    ),
                ))
        ;
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Project'
        ));
    }

}
