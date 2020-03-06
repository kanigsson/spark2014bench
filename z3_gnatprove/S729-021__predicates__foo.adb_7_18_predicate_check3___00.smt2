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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

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
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((us_split_fields (us_split_fieldsqtmk (rec__foo__context_type__x natural)))))
(define-fun us_split_fields_rec__foo__context_type__x__projection ((a us_split_fields)) natural 
  (rec__foo__context_type__x a))

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
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__foo__context_type__x (us_split_fields1 a))) 
                   (to_rep (rec__foo__context_type__x (us_split_fields1 b))))
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

(declare-const foo__context_type__x__first__bit Int)

(declare-const foo__context_type__x__last__bit Int)

(declare-const foo__context_type__x__position Int)

;; foo__context_type__x__first__bit_axiom
  (assert (<= 0 foo__context_type__x__first__bit))

;; foo__context_type__x__last__bit_axiom
  (assert
  (< foo__context_type__x__first__bit foo__context_type__x__last__bit))

;; foo__context_type__x__position_axiom
  (assert (<= 0 foo__context_type__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((context_type__ref (context_type__refqtmk (context_type__content us_rep)))))
(define-fun context_type__ref_context_type__content__projection ((a context_type__ref)) us_rep 
  (context_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun valid_x (Int) Bool)

(declare-fun valid_x__function_guard (Bool Int) Bool)

;; temp___result_163'def
  (assert
  (forall ((temp___162 us_rep)) (valid_x__function_guard
  (valid_x
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___162))))
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___162))))))

(define-fun dynamic_invariant ((temp___expr_161 us_rep)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=> (= temp___do_toplevel_159 true)
                                     (=> (= temp___is_init_157 true)
                                     (= (valid_x
                                        (to_rep
                                        (rec__foo__context_type__x
                                        (us_split_fields1 temp___expr_161)))) true))))

;; temp___result_169'def
  (assert
  (forall ((temp___168 us_rep)) (valid_x__function_guard
  (valid_x
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___168))))
  (to_rep (rec__foo__context_type__x (us_split_fields1 temp___168))))))

(define-fun dynamic_predicate ((temp___167 us_rep)) Bool (= (valid_x
                                                            (to_rep
                                                            (rec__foo__context_type__x
                                                            (us_split_fields1
                                                            temp___167)))) true))

(declare-fun valid (us_rep) Bool)

(declare-fun valid__function_guard (Bool us_rep) Bool)

;; valid__post_axiom
  (assert true)

;; valid__def_axiom
  (assert
  (forall ((context us_rep))
  (! (and
     (forall ((context1 us_rep)) (valid_x__function_guard
     (valid_x
     (to_rep (rec__foo__context_type__x (us_split_fields1 context1))))
     (to_rep (rec__foo__context_type__x (us_split_fields1 context1)))))
     (= (= (valid context) true)
     (= (valid_x
        (to_rep (rec__foo__context_type__x (us_split_fields1 context)))) true))) :pattern (
  (valid context)) )))

(declare-const i2s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

;; valid_x__post_axiom
  (assert true)

;; valid_x__def_axiom
  (assert
  (forall ((x Int))
  (! (= (= (valid_x x) true) (< 10 x)) :pattern ((valid_x x)) )))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 11))

(declare-const context__split_fields natural)

;; Assume
  (assert (dynamic_invariant i2s true false true true))

;; Assume
  (assert (dynamic_invariant i2s true false true true))

;; Assume
  (assert (dynamic_invariant
  (us_repqtmk (us_split_fieldsqtmk context__split_fields)) false false true
  true))

(define-fun temp___175 () us_rep (us_repqtmk (us_split_fieldsqtmk rliteral)))

(assert
;; defqtvc
 ;; File "foo.ads", line 7, characters 0-0
  (not (dynamic_predicate temp___175)))
(check-sat)