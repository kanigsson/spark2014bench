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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__object__t__b Bool)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__object__t__b__projection ((a us_split_fields)) Bool 
  (rec__object__t__b a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__object__t__b (us_split_fields1 a)) 1 0) (ite 
                   (rec__object__t__b (us_split_fields1 b)) 1 0)) true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const object__t__b__first__bit Int)

(declare-const object__t__b__last__bit Int)

(declare-const object__t__b__position Int)

;; object__t__b__first__bit_axiom
  (assert (<= 0 object__t__b__first__bit))

;; object__t__b__last__bit_axiom
  (assert (< object__t__b__first__bit object__t__b__last__bit))

;; object__t__b__position_axiom
  (assert (<= 0 object__t__b__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const x__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_160 us_rep)
  (temp___skip_top_level_161 Bool)) Bool (= (attr__tag temp___expr_160) 
  us_tag))

(declare-fun is_valid (us_rep) Bool)

(declare-fun is_valid__function_guard (Bool us_rep) Bool)

(declare-fun is_valid1 (Int us_rep) Bool)

(declare-fun is_valid__function_guard1 (Bool Int us_rep) Bool)

(declare-fun do_stuff__specific_post (Int us_split_fields Int
  us_split_fields) Bool)

;; object__t__compat_axiom
  (assert true)

;; is_valid__post_axiom
  (assert true)

;; is_valid__post__dispatch_axiom
  (assert true)

;; object__t__compat_axiom
  (assert
  (forall ((x us_rep))
  (! (=> (is_valid__function_guard1 (is_valid1 us_tag x) us_tag x)
     (and (forall ((x1 us_rep)) (is_valid__function_guard (is_valid x1) x1))
     (= (ite (is_valid x) 1 0) (ite (is_valid1 us_tag x) 1 0)))) :pattern (
  (is_valid1 us_tag x)) )))

;; is_valid__def_axiom
  (assert
  (forall ((x us_rep))
  (! (= (= (is_valid x) true)
     (= (rec__object__t__b (us_split_fields1 x)) true)) :pattern ((is_valid
                                                                  x)) )))

(assert
;; defqtvc
 ;; File "dispatcher.adb", line 3, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields) (spark__branch Bool))
  (=> (= spark__branch (rec__object__t__b x__split_fields))
  (=> (= spark__branch true)
  (let ((o x__attr__tag))
  (=>
  (forall ((x__split_fields1 us_split_fields) (o1 Int))
  (is_valid__function_guard1 (is_valid1 o1 (us_repqtmk x__split_fields1 o1))
  o1 (us_repqtmk x__split_fields1 o1)))
  (= (is_valid1 o (us_repqtmk x__split_fields o)) true))))))))
(check-sat)
(exit)
