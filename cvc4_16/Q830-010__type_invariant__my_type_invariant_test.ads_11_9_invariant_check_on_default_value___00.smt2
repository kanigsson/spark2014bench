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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__my_type_invariant_test__my_type__my_field Bool)))))
(define-fun us_split_fields_rec__my_type_invariant_test__my_type__my_field__projection ((a us_split_fields)) Bool 
  (rec__my_type_invariant_test__my_type__my_field a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__my_type_invariant_test__my_type__my_field
                                (us_split_fields1 a)) 1 0) (ite (rec__my_type_invariant_test__my_type__my_field
                                                                (us_split_fields1
                                                                b)) 1 0))
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

(declare-const my_type_invariant_test__my_type__my_field__first__bit Int)

(declare-const my_type_invariant_test__my_type__my_field__last__bit Int)

(declare-const my_type_invariant_test__my_type__my_field__position Int)

;; my_type_invariant_test__my_type__my_field__first__bit_axiom
  (assert (<= 0 my_type_invariant_test__my_type__my_field__first__bit))

;; my_type_invariant_test__my_type__my_field__last__bit_axiom
  (assert
  (< my_type_invariant_test__my_type__my_field__first__bit my_type_invariant_test__my_type__my_field__last__bit))

;; my_type_invariant_test__my_type__my_field__position_axiom
  (assert (<= 0 my_type_invariant_test__my_type__my_field__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((my_type__ref 0))
(((my_type__refqtmk (my_type__content us_rep)))))
(define-fun my_type__ref_my_type__content__projection ((a my_type__ref)) us_rep 
  (my_type__content a))

(declare-const foo us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun type_invariant ((temp___162 us_rep)) Bool true)

(declare-const baz us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

;; foo__def_axiom
  (assert (= foo (us_repqtmk (us_split_fieldsqtmk (distinct 1 0)))))

;; baz__def_axiom
  (assert (= baz (us_repqtmk (us_split_fieldsqtmk (distinct 1 0)))))

(assert
;; defqtvc
 ;; File "my_type_invariant_test.ads", line 1, characters 0-0
  (not
  (forall ((usf Bool)) (type_invariant
  (us_repqtmk (us_split_fieldsqtmk usf))))))
(check-sat)