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

(declare-sort node_enum 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 0)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (node_enum node_enum) Bool)

(declare-const dummy node_enum)

(declare-datatypes ((node_enum__ref 0))
(((node_enum__refqtmk (node_enum__content node_enum)))))
(define-fun node_enum__ref_node_enum__content__projection ((a node_enum__ref)) node_enum 
  (node_enum__content a))

(declare-fun to_rep (node_enum) Int)

(declare-fun of_rep (Int) node_enum)

;; inversion_axiom
  (assert
  (forall ((x node_enum))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x node_enum)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__main__node_variant_type__m_variant node_enum)))))
(define-fun us_split_discrs_rec__main__node_variant_type__m_variant__projection ((a us_split_discrs)) node_enum 
  (rec__main__node_variant_type__m_variant a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__main__node_variant_type__m_variant
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__main__node_variant_type__m_variant
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

(declare-const main__node_variant_type__m_variant__first__bit Int)

(declare-const main__node_variant_type__m_variant__last__bit Int)

(declare-const main__node_variant_type__m_variant__position Int)

;; main__node_variant_type__m_variant__first__bit_axiom
  (assert (<= 0 main__node_variant_type__m_variant__first__bit))

;; main__node_variant_type__m_variant__last__bit_axiom
  (assert
  (< main__node_variant_type__m_variant__first__bit main__node_variant_type__m_variant__last__bit))

;; main__node_variant_type__m_variant__position_axiom
  (assert (<= 0 main__node_variant_type__m_variant__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((node_variant_type__ref 0))
(((node_variant_type__refqtmk (node_variant_type__content us_rep)))))
(define-fun node_variant_type__ref_node_variant_type__content__projection ((a node_variant_type__ref)) us_rep 
  (node_variant_type__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__main__node_type__variant_node us_rep)))))
(define-fun us_split_fields_rec__main__node_type__variant_node__projection ((a us_split_fields)) us_rep 
  (rec__main__node_type__variant_node a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (bool_eq
                            (rec__main__node_type__variant_node
                            (us_split_fields1 a))
                            (rec__main__node_type__variant_node
                            (us_split_fields1 b))) true)
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const main__node_type__variant_node__first__bit Int)

(declare-const main__node_type__variant_node__last__bit Int)

(declare-const main__node_type__variant_node__position Int)

;; main__node_type__variant_node__first__bit_axiom
  (assert (<= 0 main__node_type__variant_node__first__bit))

;; main__node_type__variant_node__last__bit_axiom
  (assert
  (< main__node_type__variant_node__first__bit main__node_type__variant_node__last__bit))

;; main__node_type__variant_node__position_axiom
  (assert (<= 0 main__node_type__variant_node__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((node_type__ref 0))
(((node_type__refqtmk (node_type__content us_rep1)))))
(define-fun node_type__ref_node_type__content__projection ((a node_type__ref)) us_rep1 
  (node_type__content a))

(declare-const null_node us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_197 us_rep1)
  (temp___skip_top_level_198 Bool)) Bool (= (to_rep
                                            (rec__main__node_variant_type__m_variant
                                            (us_split_discrs1
                                            (rec__main__node_type__variant_node
                                            (us_split_fields1
                                            temp___expr_197))))) 0))

(define-fun in_range2 ((rec__main__node_variant_type__m_variant1 Int)
  (a us_rep)) Bool (= rec__main__node_variant_type__m_variant1 (to_rep
                                                               (rec__main__node_variant_type__m_variant
                                                               (us_split_discrs1
                                                               a)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const main__node_variant_type__m_variant__first__bit1 Int)

(declare-const main__node_variant_type__m_variant__last__bit1 Int)

(declare-const main__node_variant_type__m_variant__position1 Int)

;; main__node_variant_type__m_variant__first__bit_axiom
  (assert (<= 0 main__node_variant_type__m_variant__first__bit1))

;; main__node_variant_type__m_variant__last__bit_axiom
  (assert
  (< main__node_variant_type__m_variant__first__bit1 main__node_variant_type__m_variant__last__bit1))

;; main__node_variant_type__m_variant__position_axiom
  (assert (<= 0 main__node_variant_type__m_variant__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(define-fun dynamic_invariant ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 0)) (in_range1 temp___expr_179)))

(define-fun default_initial_assumption1 ((temp___expr_188 us_rep)
  (temp___skip_top_level_189 Bool)) Bool (= (to_rep
                                            (rec__main__node_variant_type__m_variant
                                            (us_split_discrs1
                                            temp___expr_188))) 0))

;; null_node__def_axiom
  (assert
  (= null_node (us_repqtmk1
               (us_split_fieldsqtmk
               (us_repqtmk (us_split_discrsqtmk (of_rep 0)))))))

(assert
;; defqtvc
 ;; File "main.adb", line 21, characters 0-0
  (not
  (forall ((o node_enum))
  (=> (= (to_rep o) 0)
  (not
  (= (us_repqtmk1 (us_split_fieldsqtmk (us_repqtmk (us_split_discrsqtmk o)))) 
  null_node))))))
(check-sat)