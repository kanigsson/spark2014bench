(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk
 (rec__split_records__record_with_mutable_discrs__present Bool)))))
(define-fun us_split_discrs_rec__split_records__record_with_mutable_discrs__present__projection ((a us_split_discrs)) Bool 
  (rec__split_records__record_with_mutable_discrs__present a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__split_records__record_with_mutable_discrs__field natural)))))
(define-fun us_split_fields_rec__split_records__record_with_mutable_discrs__field__projection ((a us_split_fields)) natural 
  (rec__split_records__record_with_mutable_discrs__field a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun split_records__record_with_mutable_discrs__field__pred ((a us_rep)) Bool (= (ite 
  (rec__split_records__record_with_mutable_discrs__present
  (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__split_records__record_with_mutable_discrs__present
                                (us_split_discrs1 a)) 1 0) (ite (rec__split_records__record_with_mutable_discrs__present
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=>
                        (split_records__record_with_mutable_discrs__field__pred
                        a)
                        (= (to_rep
                           (rec__split_records__record_with_mutable_discrs__field
                           (us_split_fields1 a))) (to_rep
                                                  (rec__split_records__record_with_mutable_discrs__field
                                                  (us_split_fields1 b))))))
                   true false))

(define-fun in_range2 ((rec__split_records__record_with_mutable_discrs__present1 Bool)
  (a us_split_discrs)) Bool (= rec__split_records__record_with_mutable_discrs__present1 
  (rec__split_records__record_with_mutable_discrs__present a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const split_records__record_with_mutable_discrs__present__first__bit Int)

(declare-const split_records__record_with_mutable_discrs__present__last__bit Int)

(declare-const split_records__record_with_mutable_discrs__present__position Int)

;; split_records__record_with_mutable_discrs__present__first__bit_axiom
  (assert
  (<= 0 split_records__record_with_mutable_discrs__present__first__bit))

;; split_records__record_with_mutable_discrs__present__last__bit_axiom
  (assert
  (< split_records__record_with_mutable_discrs__present__first__bit split_records__record_with_mutable_discrs__present__last__bit))

;; split_records__record_with_mutable_discrs__present__position_axiom
  (assert
  (<= 0 split_records__record_with_mutable_discrs__present__position))

(declare-const split_records__record_with_mutable_discrs__field__first__bit Int)

(declare-const split_records__record_with_mutable_discrs__field__last__bit Int)

(declare-const split_records__record_with_mutable_discrs__field__position Int)

;; split_records__record_with_mutable_discrs__field__first__bit_axiom
  (assert
  (<= 0 split_records__record_with_mutable_discrs__field__first__bit))

;; split_records__record_with_mutable_discrs__field__last__bit_axiom
  (assert
  (< split_records__record_with_mutable_discrs__field__first__bit split_records__record_with_mutable_discrs__field__last__bit))

;; split_records__record_with_mutable_discrs__field__position_axiom
  (assert (<= 0 split_records__record_with_mutable_discrs__field__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((record_with_mutable_discrs__ref
 (record_with_mutable_discrs__refqtmk
 (record_with_mutable_discrs__content us_rep)))))
(define-fun record_with_mutable_discrs__ref_record_with_mutable_discrs__content__projection ((a record_with_mutable_discrs__ref)) us_rep 
  (record_with_mutable_discrs__content a))

(declare-const r__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_164 us_rep)
  (temp___skip_top_level_165 Bool)) Bool (= (rec__split_records__record_with_mutable_discrs__present
                                            (us_split_discrs1
                                            temp___expr_164)) (distinct 0 0)))

(declare-const new_field Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r2b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const split_records__record_with_mutable_discrs__present__first__bit1 Int)

(declare-const split_records__record_with_mutable_discrs__present__last__bit1 Int)

(declare-const split_records__record_with_mutable_discrs__present__position1 Int)

;; split_records__record_with_mutable_discrs__present__first__bit_axiom
  (assert
  (<= 0 split_records__record_with_mutable_discrs__present__first__bit1))

;; split_records__record_with_mutable_discrs__present__last__bit_axiom
  (assert
  (< split_records__record_with_mutable_discrs__present__first__bit1 
  split_records__record_with_mutable_discrs__present__last__bit1))

;; split_records__record_with_mutable_discrs__present__position_axiom
  (assert
  (<= 0 split_records__record_with_mutable_discrs__present__position1))

(declare-const split_records__record_with_mutable_discrs__field__first__bit1 Int)

(declare-const split_records__record_with_mutable_discrs__field__last__bit1 Int)

(declare-const split_records__record_with_mutable_discrs__field__position1 Int)

;; split_records__record_with_mutable_discrs__field__first__bit_axiom
  (assert
  (<= 0 split_records__record_with_mutable_discrs__field__first__bit1))

;; split_records__record_with_mutable_discrs__field__last__bit_axiom
  (assert
  (< split_records__record_with_mutable_discrs__field__first__bit1 split_records__record_with_mutable_discrs__field__last__bit1))

;; split_records__record_with_mutable_discrs__field__position_axiom
  (assert (<= 0 split_records__record_with_mutable_discrs__field__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes () ((t3b__ref (t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-const r__split_fields natural)

(declare-const r__split_discrs Bool)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant new_field true false true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch r__split_discrs))

;; H
  (assert (= spark__branch true))

(assert
;; defqtvc
 ;; File "split_records.ads", line 22, characters 0-0
  (not (split_records__record_with_mutable_discrs__field__pred
  (us_repqtmk (us_split_discrsqtmk r__split_discrs)
  (us_split_fieldsqtmk r__split_fields)))))
(check-sat)
