;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__main__t__is_null_pointer Bool)(rec__main__t__pointer_address Int)(rec__main__t__pointer_value Bool)))))
(define-fun us_rep_rec__main__t__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__main__t__is_null_pointer a))

(define-fun us_rep_rec__main__t__pointer_address__projection ((a us_rep)) Int 
  (rec__main__t__pointer_address a))

(define-fun us_rep_rec__main__t__pointer_value__projection ((a us_rep)) Bool 
  (rec__main__t__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__main__t__is_null_pointer a) (rec__main__t__is_null_pointer
                                                             b))
                        (=> (not (= (rec__main__t__is_null_pointer a) true))
                        (and
                        (= (rec__main__t__pointer_address a) (rec__main__t__pointer_address
                                                             b))
                        (= (rec__main__t__pointer_value a) (rec__main__t__pointer_value
                                                           b)))))
                   true false))

(define-fun rec__main__t__pointer_value__pred ((a us_rep)) Bool (not
                                                                (= (rec__main__t__is_null_pointer
                                                                   a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__main__t__is_null_pointer us_null_pointer) true))

(declare-const dummy us_rep)

(declare-datatypes ((name__ref 0))
(((name__refqtmk (name__content us_rep)))))
(define-fun name__ref_name__content__projection ((a name__ref)) us_rep 
  (name__content a))

(define-fun default_initial_assumption ((temp___expr_187 us_rep)
  (temp___skip_top_level_188 Bool)) Bool (= (rec__main__t__is_null_pointer
                                            temp___expr_187) true))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const dummy1 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(define-fun default_initial_assumption1 ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (= (rec__main__t__is_null_pointer
                                            temp___expr_180) true))

(assert
;; defqtvc
 ;; File "main.adb", line 11, characters 0-0
  (not
  (forall ((us_next_pointer_address Int) (main__a__y__assume us_rep)
  (y__pointer_value Bool) (y__pointer_address Int) (y__is_null_pointer Bool)
  (y__pointer_address1 Int) (y__is_null_pointer1 Bool)
  (main__free__x__value Bool) (y__pointer_value1 Bool)
  (y__pointer_address2 Int) (y__is_null_pointer2 Bool))
  (=>
  (= (and (ite (and
               (not
               (= (rec__main__t__is_null_pointer main__a__y__assume) true))
               (= (rec__main__t__pointer_address main__a__y__assume) us_next_pointer_address))
          true false) (ite (= (ite (rec__main__t__pointer_value
                                   main__a__y__assume) 1 0) (ite (distinct 1 0) 1 0))
                      true false)) true)
  (=> (= y__pointer_value (rec__main__t__pointer_value main__a__y__assume))
  (=>
  (= y__pointer_address (rec__main__t__pointer_address main__a__y__assume))
  (=>
  (= y__is_null_pointer (rec__main__t__is_null_pointer main__a__y__assume))
  (=> (= y__pointer_value true)
  (=> (= y__is_null_pointer2 y__is_null_pointer1)
  (=> (= y__pointer_address2 y__pointer_address1)
  (=> (= y__pointer_value1 main__free__x__value)
  (= (bool_eq
     (us_repqtmk y__is_null_pointer2 y__pointer_address2 y__pointer_value1)
     us_null_pointer) true))))))))))))
(check-sat)