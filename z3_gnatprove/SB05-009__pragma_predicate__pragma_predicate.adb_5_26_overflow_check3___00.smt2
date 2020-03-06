;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

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
((us_split_fields
 (us_split_fieldsqtmk
 (rec__pragma_predicate__tuple_type__x natural)(rec__pragma_predicate__tuple_type__y natural)))))
(define-fun us_split_fields_rec__pragma_predicate__tuple_type__x__projection ((a us_split_fields)) natural 
  (rec__pragma_predicate__tuple_type__x a))

(define-fun us_split_fields_rec__pragma_predicate__tuple_type__y__projection ((a us_split_fields)) natural 
  (rec__pragma_predicate__tuple_type__y a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__pragma_predicate__tuple_type__x
                           (us_split_fields1 a))) (to_rep
                                                  (rec__pragma_predicate__tuple_type__x
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__pragma_predicate__tuple_type__y
                           (us_split_fields1 a))) (to_rep
                                                  (rec__pragma_predicate__tuple_type__y
                                                  (us_split_fields1 b)))))
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

(declare-const pragma_predicate__tuple_type__x__first__bit Int)

(declare-const pragma_predicate__tuple_type__x__last__bit Int)

(declare-const pragma_predicate__tuple_type__x__position Int)

;; pragma_predicate__tuple_type__x__first__bit_axiom
  (assert (<= 0 pragma_predicate__tuple_type__x__first__bit))

;; pragma_predicate__tuple_type__x__last__bit_axiom
  (assert
  (< pragma_predicate__tuple_type__x__first__bit pragma_predicate__tuple_type__x__last__bit))

;; pragma_predicate__tuple_type__x__position_axiom
  (assert (<= 0 pragma_predicate__tuple_type__x__position))

(declare-const pragma_predicate__tuple_type__y__first__bit Int)

(declare-const pragma_predicate__tuple_type__y__last__bit Int)

(declare-const pragma_predicate__tuple_type__y__position Int)

;; pragma_predicate__tuple_type__y__first__bit_axiom
  (assert (<= 0 pragma_predicate__tuple_type__y__first__bit))

;; pragma_predicate__tuple_type__y__last__bit_axiom
  (assert
  (< pragma_predicate__tuple_type__y__first__bit pragma_predicate__tuple_type__y__last__bit))

;; pragma_predicate__tuple_type__y__position_axiom
  (assert (<= 0 pragma_predicate__tuple_type__y__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((tuple_type__ref (tuple_type__refqtmk (tuple_type__content us_rep)))))
(define-fun tuple_type__ref_tuple_type__content__projection ((a tuple_type__ref)) us_rep 
  (tuple_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_159 us_rep)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=> (= temp___do_toplevel_157 true)
                                     (=> (= temp___is_init_155 true)
                                     (<= (to_rep
                                         (rec__pragma_predicate__tuple_type__y
                                         (us_split_fields1 temp___expr_159))) 
                                     (to_rep
                                     (rec__pragma_predicate__tuple_type__x
                                     (us_split_fields1 temp___expr_159)))))))

(define-fun dynamic_predicate ((temp___165 us_rep)) Bool (<= (to_rep
                                                             (rec__pragma_predicate__tuple_type__y
                                                             (us_split_fields1
                                                             temp___165))) 
  (to_rep
  (rec__pragma_predicate__tuple_type__x (us_split_fields1 temp___165)))))

(declare-const i3s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const tuple__split_fields us_split_fields)

;; Assume
  (assert (dynamic_invariant i3s true false true true))

;; Assume
  (assert (dynamic_invariant i3s true false true true))

;; Assume
  (assert (dynamic_invariant (us_repqtmk tuple__split_fields) true false true
  true))

;; Assume
  (assert
  (< (to_rep (rec__pragma_predicate__tuple_type__x tuple__split_fields)) 2147483647))

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep (rec__pragma_predicate__tuple_type__x tuple__split_fields)) 
  o))

(define-fun o1 () Int (+ o 1))

(assert
;; defqtvc
 ;; File "pragma_predicate.ads", line 15, characters 0-0
  (not (in_range o1)))
(check-sat)