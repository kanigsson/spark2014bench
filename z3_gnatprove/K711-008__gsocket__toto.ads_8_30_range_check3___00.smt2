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

(declare-sort family_type 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 0)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (family_type family_type) Bool)

(declare-const dummy family_type)

(declare-datatypes ()
((family_type__ref (family_type__refqtmk (family_type__content family_type)))))
(define-fun family_type__ref_family_type__content__projection ((a family_type__ref)) family_type 
  (family_type__content a))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 0)) (in_range temp___expr_158)))

(declare-fun to_rep (family_type) Int)

(declare-fun of_rep (Int) family_type)

;; inversion_axiom
  (assert
  (forall ((x family_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x family_type)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__toto__inet_addr_type__family family_type)))))
(define-fun us_split_discrs_rec__toto__inet_addr_type__family__projection ((a us_split_discrs)) family_type 
  (rec__toto__inet_addr_type__family a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__toto__inet_addr_type__family
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__toto__inet_addr_type__family
                                                  (us_split_discrs1 b))))
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

(declare-const toto__inet_addr_type__family__first__bit Int)

(declare-const toto__inet_addr_type__family__last__bit Int)

(declare-const toto__inet_addr_type__family__position Int)

;; toto__inet_addr_type__family__first__bit_axiom
  (assert (<= 0 toto__inet_addr_type__family__first__bit))

;; toto__inet_addr_type__family__last__bit_axiom
  (assert
  (< toto__inet_addr_type__family__first__bit toto__inet_addr_type__family__last__bit))

;; toto__inet_addr_type__family__position_axiom
  (assert (<= 0 toto__inet_addr_type__family__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((t1s__ref (t1s__refqtmk (t1s__content us_rep)))))
(define-fun t1s__ref_t1s__content__projection ((a t1s__ref)) us_rep (t1s__content
                                                                    a))

(declare-datatypes ()
((us_split_discrs2
 (us_split_discrsqtmk1 (rec__toto__sock_addr_type__family family_type)))))
(define-fun us_split_discrs_rec__toto__sock_addr_type__family__projection ((a us_split_discrs2)) family_type 
  (rec__toto__sock_addr_type__family a))

(declare-datatypes ()
((us_split_discrs__ref1
 (us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__toto__sock_addr_type__addr us_rep)))))
(define-fun us_split_fields_rec__toto__sock_addr_type__addr__projection ((a us_split_fields)) us_rep 
  (rec__toto__sock_addr_type__addr a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs3 us_split_discrs2)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__toto__sock_addr_type__family
                            (us_split_discrs3 a))) (to_rep
                                                   (rec__toto__sock_addr_type__family
                                                   (us_split_discrs3 b))))
                         (= (bool_eq
                            (rec__toto__sock_addr_type__addr
                            (us_split_fields1 a))
                            (rec__toto__sock_addr_type__addr
                            (us_split_fields1 b))) true))
                    true false))

(define-fun in_range1 ((rec__toto__sock_addr_type__family1 Int)
  (a us_split_discrs2)) Bool (= rec__toto__sock_addr_type__family1 (to_rep
                                                                   (rec__toto__sock_addr_type__family
                                                                   a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const toto__sock_addr_type__family__first__bit Int)

(declare-const toto__sock_addr_type__family__last__bit Int)

(declare-const toto__sock_addr_type__family__position Int)

;; toto__sock_addr_type__family__first__bit_axiom
  (assert (<= 0 toto__sock_addr_type__family__first__bit))

;; toto__sock_addr_type__family__last__bit_axiom
  (assert
  (< toto__sock_addr_type__family__first__bit toto__sock_addr_type__family__last__bit))

;; toto__sock_addr_type__family__position_axiom
  (assert (<= 0 toto__sock_addr_type__family__position))

(declare-const toto__sock_addr_type__addr__first__bit Int)

(declare-const toto__sock_addr_type__addr__last__bit Int)

(declare-const toto__sock_addr_type__addr__position Int)

;; toto__sock_addr_type__addr__first__bit_axiom
  (assert (<= 0 toto__sock_addr_type__addr__first__bit))

;; toto__sock_addr_type__addr__last__bit_axiom
  (assert
  (< toto__sock_addr_type__addr__first__bit toto__sock_addr_type__addr__last__bit))

;; toto__sock_addr_type__addr__position_axiom
  (assert (<= 0 toto__sock_addr_type__addr__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((sock_addr_type__ref
 (sock_addr_type__refqtmk (sock_addr_type__content us_rep1)))))
(define-fun sock_addr_type__ref_sock_addr_type__content__projection ((a sock_addr_type__ref)) us_rep1 
  (sock_addr_type__content a))

(define-fun in_range2 ((rec__toto__inet_addr_type__family1 Int)
  (a us_split_discrs)) Bool (= rec__toto__inet_addr_type__family1 (to_rep
                                                                  (rec__toto__inet_addr_type__family
                                                                  a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const toto__inet_addr_type__family__first__bit1 Int)

(declare-const toto__inet_addr_type__family__last__bit1 Int)

(declare-const toto__inet_addr_type__family__position1 Int)

;; toto__inet_addr_type__family__first__bit_axiom
  (assert (<= 0 toto__inet_addr_type__family__first__bit1))

;; toto__inet_addr_type__family__last__bit_axiom
  (assert
  (< toto__inet_addr_type__family__first__bit1 toto__inet_addr_type__family__last__bit1))

;; toto__inet_addr_type__family__position_axiom
  (assert (<= 0 toto__inet_addr_type__family__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((inet_addr_type__ref
 (inet_addr_type__refqtmk (inet_addr_type__content us_rep)))))
(define-fun inet_addr_type__ref_inet_addr_type__content__projection ((a inet_addr_type__ref)) us_rep 
  (inet_addr_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_174 us_rep1)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool) (temp___do_typ_inv_173 Bool)) Bool (in_range2
  (to_rep
  (rec__toto__sock_addr_type__family (us_split_discrs3 temp___expr_174)))
  (us_split_discrs1
  (rec__toto__sock_addr_type__addr (us_split_fields1 temp___expr_174)))))

(define-fun default_initial_assumption ((temp___expr_177 us_rep1)
  (temp___skip_top_level_178 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__toto__sock_addr_type__family
                                            (us_split_discrs3
                                            temp___expr_177))) 0)
                                         (= (to_rep
                                            (rec__toto__inet_addr_type__family
                                            (us_split_discrs1
                                            (rec__toto__sock_addr_type__addr
                                            (us_split_fields1
                                            temp___expr_177))))) (to_rep
                                                                 (rec__toto__sock_addr_type__family
                                                                 (us_split_discrs3
                                                                 temp___expr_177))))))

(define-fun default_initial_assumption1 ((temp___expr_167 us_rep)
  (temp___skip_top_level_168 Bool)) Bool (= (to_rep
                                            (rec__toto__inet_addr_type__family
                                            (us_split_discrs1
                                            temp___expr_167))) 0))

(declare-const usf Int)

;; Ensures
  (assert (dynamic_invariant usf true true true true))

(declare-const usf1 us_rep1)

;; Ensures
  (assert
  (= (to_rep (rec__toto__sock_addr_type__family (us_split_discrs3 usf1))) 
  usf))

(assert
;; defqtvc
 ;; File "toto.ads", line 1, characters 0-0
  (not (in_range usf)))
(check-sat)

(exit)
