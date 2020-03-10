(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort character 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (character character) Bool)

(declare-const dummy character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(define-fun dynamic_invariant ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range1 temp___expr_74)))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__linked_list_types_types__list__is_null_pointer Bool)(rec__linked_list_types_types__list__pointer_address Int)(rec__linked_list_types_types__list__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__linked_list_types_types__list__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__linked_list_types_types__list__is_null_pointer a))

(define-fun us_rep_rec__linked_list_types_types__list__pointer_address__projection ((a us_rep)) Int 
  (rec__linked_list_types_types__list__pointer_address a))

(define-fun us_rep_rec__linked_list_types_types__list__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__linked_list_types_types__list__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__linked_list_types_types__list__is_null_pointer
                           a) (rec__linked_list_types_types__list__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__linked_list_types_types__list__is_null_pointer
                           a) true))
                        (and
                        (= (rec__linked_list_types_types__list__pointer_address
                           a) (rec__linked_list_types_types__list__pointer_address
                              b))
                        (= (rec__linked_list_types_types__list__pointer_value_abstr
                           a) (rec__linked_list_types_types__list__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__linked_list_types_types__list_node__key character)(rec__linked_list_types_types__list_node__next us_rep)))))
(define-fun us_split_fields_rec__linked_list_types_types__list_node__key__projection ((a us_split_fields)) character 
  (rec__linked_list_types_types__list_node__key a))

(define-fun us_split_fields_rec__linked_list_types_types__list_node__next__projection ((a us_split_fields)) us_rep 
  (rec__linked_list_types_types__list_node__next a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__linked_list_types_types__list_node__key
                            (us_split_fields1 a))) (to_rep
                                                   (rec__linked_list_types_types__list_node__key
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__linked_list_types_types__list_node__next
                            (us_split_fields1 a))
                            (rec__linked_list_types_types__list_node__next
                            (us_split_fields1 b))) true))
                    true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const linked_list_types_types__list_node__key__first__bit Int)

(declare-const linked_list_types_types__list_node__key__last__bit Int)

(declare-const linked_list_types_types__list_node__key__position Int)

;; linked_list_types_types__list_node__key__first__bit_axiom
  (assert (<= 0 linked_list_types_types__list_node__key__first__bit))

;; linked_list_types_types__list_node__key__last__bit_axiom
  (assert
  (< linked_list_types_types__list_node__key__first__bit linked_list_types_types__list_node__key__last__bit))

;; linked_list_types_types__list_node__key__position_axiom
  (assert (<= 0 linked_list_types_types__list_node__key__position))

(declare-const linked_list_types_types__list_node__next__first__bit Int)

(declare-const linked_list_types_types__list_node__next__last__bit Int)

(declare-const linked_list_types_types__list_node__next__position Int)

;; linked_list_types_types__list_node__next__first__bit_axiom
  (assert (<= 0 linked_list_types_types__list_node__next__first__bit))

;; linked_list_types_types__list_node__next__last__bit_axiom
  (assert
  (< linked_list_types_types__list_node__next__first__bit linked_list_types_types__list_node__next__last__bit))

;; linked_list_types_types__list_node__next__position_axiom
  (assert (<= 0 linked_list_types_types__list_node__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((list_node__ref 0))
(((list_node__refqtmk (list_node__content us_rep1)))))
(define-fun list_node__ref_list_node__content__projection ((a list_node__ref)) us_rep1 
  (list_node__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const key Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun default_initial_assumption ((temp___expr_159 us_rep)
  (temp___skip_top_level_160 Bool)) Bool (= (rec__linked_list_types_types__list__is_null_pointer
                                            temp___expr_159) true))

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__linked_list_types_types__list__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__linked_list_types_types__list__pointer_value_abstr a)))

(define-fun rec__linked_list_types_types__list__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__linked_list_types_types__list__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__linked_list_types_types__list__is_null_pointer us_null_pointer) true))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun default_initial_assumption1 ((temp___expr_166 us_rep1)
  (temp___skip_top_level_167 Bool)) Bool (= (rec__linked_list_types_types__list__is_null_pointer
                                            (rec__linked_list_types_types__list_node__next
                                            (us_split_fields1
                                            temp___expr_166))) true))

(assert
;; defqtvc
 ;; File "update_lists.ads", line 6, characters 0-0
  (not
  (forall ((rover__pointer_value us_split_fields)
  (rover__pointer_address Int) (rover__is_null_pointer Bool))
  (=> (dynamic_invariant key true false true true)
  (let ((update_lists__prev__assume us_null_pointer))
  (forall ((prev__pointer_value us_split_fields))
  (=>
  (= (us_repqtmk1 prev__pointer_value) (rec__linked_list_types_types__list__pointer_value
                                       update_lists__prev__assume))
  (forall ((prev__pointer_address Int))
  (=>
  (= prev__pointer_address (rec__linked_list_types_types__list__pointer_address
                           update_lists__prev__assume))
  (forall ((prev__is_null_pointer Bool))
  (=>
  (= prev__is_null_pointer (rec__linked_list_types_types__list__is_null_pointer
                           update_lists__prev__assume))
  (=> (default_initial_assumption
  (us_repqtmk rover__is_null_pointer rover__pointer_address
  (us_close (us_repqtmk1 rover__pointer_value))) false)
  (forall ((rover__pointer_value1 us_split_fields)
  (rover__pointer_address1 Int) (rover__is_null_pointer1 Bool))
  (=>
  (= (not (bool_eq
          (us_repqtmk rover__is_null_pointer1 rover__pointer_address1
          (us_close (us_repqtmk1 rover__pointer_value1))) us_null_pointer)) true)
  (forall ((prev__pointer_value1 us_split_fields)
  (prev__pointer_address1 Int) (prev__is_null_pointer1 Bool)
  (rover__pointer_value2 us_split_fields) (rover__pointer_address2 Int)
  (rover__is_null_pointer2 Bool) (next_rover__pointer_value us_split_fields)
  (next_rover__pointer_address Int) (next_rover__is_null_pointer Bool))
  (=>
  (= (and (ite true true false) (ite (not
                                     (= (bool_eq
                                        (us_repqtmk rover__is_null_pointer2
                                        rover__pointer_address2
                                        (us_close
                                        (us_repqtmk1 rover__pointer_value2)))
                                        us_null_pointer) true))
                                true false)) true)
  (forall ((o Int))
  (=>
  (= (to_rep
     (rec__linked_list_types_types__list_node__key
     (us_split_fields1
     (rec__linked_list_types_types__list__pointer_value
     (us_repqtmk rover__is_null_pointer2 rover__pointer_address2
     (us_close (us_repqtmk1 rover__pointer_value2))))))) o)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (= o key) true false))
  (=> (= spark__branch true)
  (forall ((rover__pointer_value3 us_split_fields))
  (=>
  (exists ((spark__branch1 Bool))
  (and
  (= spark__branch1 (bool_eq
                    (us_repqtmk prev__is_null_pointer1 prev__pointer_address1
                    (us_close (us_repqtmk1 prev__pointer_value1)))
                    us_null_pointer))
  (exists ((update_lists__assign__source__is_null Bool)
  (update_lists__assign__source__addr Int)
  (update_lists__assign__source__value us_split_fields))
  (= (us_repqtmk1 rover__pointer_value3) (rec__linked_list_types_types__list__pointer_value
                                         (us_repqtmk rover__is_null_pointer2
                                         rover__pointer_address2
                                         (us_close
                                         (us_repqtmk1
                                         (us_split_fieldsqtmk
                                         (rec__linked_list_types_types__list_node__key
                                         (us_split_fields1
                                         (rec__linked_list_types_types__list__pointer_value
                                         (us_repqtmk rover__is_null_pointer2
                                         rover__pointer_address2
                                         (us_close
                                         (us_repqtmk1 rover__pointer_value2))))))
                                         (us_repqtmk
                                         update_lists__assign__source__is_null
                                         update_lists__assign__source__addr
                                         (us_close
                                         (us_repqtmk1
                                         update_lists__assign__source__value))))))))))))
  (=> (default_initial_assumption
  (us_repqtmk next_rover__is_null_pointer next_rover__pointer_address
  (us_close (us_repqtmk1 next_rover__pointer_value))) false)
  (forall ((update_lists__assign__source__is_null Bool)
  (update_lists__assign__source__addr Int)
  (update_lists__assign__source__value us_split_fields))
  (forall ((rover__pointer_value4 us_split_fields))
  (=>
  (= (us_repqtmk1 rover__pointer_value4) (rec__linked_list_types_types__list__pointer_value
                                         (us_repqtmk rover__is_null_pointer2
                                         rover__pointer_address2
                                         (us_close
                                         (us_repqtmk1
                                         (us_split_fieldsqtmk
                                         (rec__linked_list_types_types__list_node__key
                                         (us_split_fields1
                                         (rec__linked_list_types_types__list__pointer_value
                                         (us_repqtmk rover__is_null_pointer2
                                         rover__pointer_address2
                                         (us_close
                                         (us_repqtmk1 rover__pointer_value3))))))
                                         (us_repqtmk
                                         update_lists__assign__source__is_null
                                         update_lists__assign__source__addr
                                         (us_close
                                         (us_repqtmk1
                                         update_lists__assign__source__value)))))))))
  (rec__linked_list_types_types__list__pointer_value__pred
  (us_repqtmk rover__is_null_pointer2 rover__pointer_address2
  (us_close (us_repqtmk1 rover__pointer_value4)))))))))))))))))))))))))))))))
(check-sat)
(exit)
