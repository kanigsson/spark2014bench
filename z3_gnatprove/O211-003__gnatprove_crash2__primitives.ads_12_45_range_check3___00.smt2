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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__tree_logic__branch_read_iterator_type__m_is_valid Bool)))))
(define-fun us_split_fields_rec__tree_logic__branch_read_iterator_type__m_is_valid__projection ((a us_split_fields)) Bool 
  (rec__tree_logic__branch_read_iterator_type__m_is_valid a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__tree_logic__branch_read_iterator_type__m_is_valid
                                (us_split_fields1 a)) 1 0) (ite (rec__tree_logic__branch_read_iterator_type__m_is_valid
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

(declare-const tree_logic__branch_read_iterator_type__m_is_valid__first__bit Int)

(declare-const tree_logic__branch_read_iterator_type__m_is_valid__last__bit Int)

(declare-const tree_logic__branch_read_iterator_type__m_is_valid__position Int)

;; tree_logic__branch_read_iterator_type__m_is_valid__first__bit_axiom
  (assert
  (<= 0 tree_logic__branch_read_iterator_type__m_is_valid__first__bit))

;; tree_logic__branch_read_iterator_type__m_is_valid__last__bit_axiom
  (assert
  (< tree_logic__branch_read_iterator_type__m_is_valid__first__bit tree_logic__branch_read_iterator_type__m_is_valid__last__bit))

;; tree_logic__branch_read_iterator_type__m_is_valid__position_axiom
  (assert (<= 0 tree_logic__branch_read_iterator_type__m_is_valid__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ()
((branch_read_iterator_type__ref
 (branch_read_iterator_type__refqtmk
 (branch_read_iterator_type__content us_rep)))))
(define-fun branch_read_iterator_type__ref_branch_read_iterator_type__content__projection ((a branch_read_iterator_type__ref)) us_rep 
  (branch_read_iterator_type__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort subtree_enum 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (subtree_enum subtree_enum) Bool)

(declare-const dummy2 subtree_enum)

(declare-datatypes ()
((subtree_enum__ref
 (subtree_enum__refqtmk (subtree_enum__content subtree_enum)))))
(define-fun subtree_enum__ref_subtree_enum__content__projection ((a subtree_enum__ref)) subtree_enum 
  (subtree_enum__content a))

(declare-fun to_rep1 (subtree_enum) Int)

(declare-fun of_rep1 (Int) subtree_enum)

;; inversion_axiom
  (assert
  (forall ((x subtree_enum))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x subtree_enum)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__tree_logic__branch_type__m_variant subtree_enum)))))
(define-fun us_split_discrs_rec__tree_logic__branch_type__m_variant__projection ((a us_split_discrs)) subtree_enum 
  (rec__tree_logic__branch_type__m_variant a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__tree_logic__branch_type__m_logical_address integer)))))
(define-fun us_split_fields_rec__tree_logic__branch_type__m_logical_address__projection ((a us_split_fields2)) integer 
  (rec__tree_logic__branch_type__m_logical_address a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__tree_logic__branch_type__m_variant
                            (us_split_discrs1 a))) (to_rep1
                                                   (rec__tree_logic__branch_type__m_variant
                                                   (us_split_discrs1 b))))
                         (= (to_rep
                            (rec__tree_logic__branch_type__m_logical_address
                            (us_split_fields3 a))) (to_rep
                                                   (rec__tree_logic__branch_type__m_logical_address
                                                   (us_split_fields3 b)))))
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

(declare-const tree_logic__branch_type__m_variant__first__bit Int)

(declare-const tree_logic__branch_type__m_variant__last__bit Int)

(declare-const tree_logic__branch_type__m_variant__position Int)

;; tree_logic__branch_type__m_variant__first__bit_axiom
  (assert (<= 0 tree_logic__branch_type__m_variant__first__bit))

;; tree_logic__branch_type__m_variant__last__bit_axiom
  (assert
  (< tree_logic__branch_type__m_variant__first__bit tree_logic__branch_type__m_variant__last__bit))

;; tree_logic__branch_type__m_variant__position_axiom
  (assert (<= 0 tree_logic__branch_type__m_variant__position))

(declare-const tree_logic__branch_type__m_logical_address__first__bit Int)

(declare-const tree_logic__branch_type__m_logical_address__last__bit Int)

(declare-const tree_logic__branch_type__m_logical_address__position Int)

;; tree_logic__branch_type__m_logical_address__first__bit_axiom
  (assert (<= 0 tree_logic__branch_type__m_logical_address__first__bit))

;; tree_logic__branch_type__m_logical_address__last__bit_axiom
  (assert
  (< tree_logic__branch_type__m_logical_address__first__bit tree_logic__branch_type__m_logical_address__last__bit))

;; tree_logic__branch_type__m_logical_address__position_axiom
  (assert (<= 0 tree_logic__branch_type__m_logical_address__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes () ((t1s__ref (t1s__refqtmk (t1s__content us_rep1)))))
(define-fun t1s__ref_t1s__content__projection ((a t1s__ref)) us_rep1 
  (t1s__content a))

(declare-datatypes ()
((us_split_discrs2
 (us_split_discrsqtmk1 (rec__primitives__primitive_type__m_io_error Bool)))))
(define-fun us_split_discrs_rec__primitives__primitive_type__m_io_error__projection ((a us_split_discrs2)) Bool 
  (rec__primitives__primitive_type__m_io_error a))

(declare-datatypes ()
((us_split_discrs__ref1
 (us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ()
((us_split_fields4
 (us_split_fieldsqtmk2
 (rec__primitives__primitive_type__m_read_branch us_rep1)(rec__primitives__primitive_type__m_read_iterator us_rep)))))
(define-fun us_split_fields_rec__primitives__primitive_type__m_read_branch__projection ((a us_split_fields4)) us_rep1 
  (rec__primitives__primitive_type__m_read_branch a))

(define-fun us_split_fields_rec__primitives__primitive_type__m_read_iterator__projection ((a us_split_fields4)) us_rep 
  (rec__primitives__primitive_type__m_read_iterator a))

(declare-datatypes ()
((us_split_fields__ref2
 (us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (us_split_discrs3 us_split_discrs2)(us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep2)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (ite (rec__primitives__primitive_type__m_io_error
                                 (us_split_discrs3 a)) 1 0) (ite (rec__primitives__primitive_type__m_io_error
                                                                 (us_split_discrs3
                                                                 b)) 1 0))
                         (and
                         (= (bool_eq1
                            (rec__primitives__primitive_type__m_read_branch
                            (us_split_fields5 a))
                            (rec__primitives__primitive_type__m_read_branch
                            (us_split_fields5 b))) true)
                         (= (bool_eq
                            (rec__primitives__primitive_type__m_read_iterator
                            (us_split_fields5 a))
                            (rec__primitives__primitive_type__m_read_iterator
                            (us_split_fields5 b))) true)))
                    true false))

(define-fun in_range3 ((rec__primitives__primitive_type__m_io_error1 Bool)
  (a us_split_discrs2)) Bool (= rec__primitives__primitive_type__m_io_error1 
  (rec__primitives__primitive_type__m_io_error a)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const primitives__primitive_type__m_io_error__first__bit Int)

(declare-const primitives__primitive_type__m_io_error__last__bit Int)

(declare-const primitives__primitive_type__m_io_error__position Int)

;; primitives__primitive_type__m_io_error__first__bit_axiom
  (assert (<= 0 primitives__primitive_type__m_io_error__first__bit))

;; primitives__primitive_type__m_io_error__last__bit_axiom
  (assert
  (< primitives__primitive_type__m_io_error__first__bit primitives__primitive_type__m_io_error__last__bit))

;; primitives__primitive_type__m_io_error__position_axiom
  (assert (<= 0 primitives__primitive_type__m_io_error__position))

(declare-const primitives__primitive_type__m_read_branch__first__bit Int)

(declare-const primitives__primitive_type__m_read_branch__last__bit Int)

(declare-const primitives__primitive_type__m_read_branch__position Int)

;; primitives__primitive_type__m_read_branch__first__bit_axiom
  (assert (<= 0 primitives__primitive_type__m_read_branch__first__bit))

;; primitives__primitive_type__m_read_branch__last__bit_axiom
  (assert
  (< primitives__primitive_type__m_read_branch__first__bit primitives__primitive_type__m_read_branch__last__bit))

;; primitives__primitive_type__m_read_branch__position_axiom
  (assert (<= 0 primitives__primitive_type__m_read_branch__position))

(declare-const primitives__primitive_type__m_read_iterator__first__bit Int)

(declare-const primitives__primitive_type__m_read_iterator__last__bit Int)

(declare-const primitives__primitive_type__m_read_iterator__position Int)

;; primitives__primitive_type__m_read_iterator__first__bit_axiom
  (assert (<= 0 primitives__primitive_type__m_read_iterator__first__bit))

;; primitives__primitive_type__m_read_iterator__last__bit_axiom
  (assert
  (< primitives__primitive_type__m_read_iterator__first__bit primitives__primitive_type__m_read_iterator__last__bit))

;; primitives__primitive_type__m_read_iterator__position_axiom
  (assert (<= 0 primitives__primitive_type__m_read_iterator__position))

(declare-fun user_eq4 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes ()
((primitive_type__ref
 (primitive_type__refqtmk (primitive_type__content us_rep2)))))
(define-fun primitive_type__ref_primitive_type__content__projection ((a primitive_type__ref)) us_rep2 
  (primitive_type__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun in_range4 ((rec__tree_logic__branch_type__m_variant1 Int)
  (a us_split_discrs)) Bool (= rec__tree_logic__branch_type__m_variant1 
  (to_rep1 (rec__tree_logic__branch_type__m_variant a))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const tree_logic__branch_type__m_variant__first__bit1 Int)

(declare-const tree_logic__branch_type__m_variant__last__bit1 Int)

(declare-const tree_logic__branch_type__m_variant__position1 Int)

;; tree_logic__branch_type__m_variant__first__bit_axiom
  (assert (<= 0 tree_logic__branch_type__m_variant__first__bit1))

;; tree_logic__branch_type__m_variant__last__bit_axiom
  (assert
  (< tree_logic__branch_type__m_variant__first__bit1 tree_logic__branch_type__m_variant__last__bit1))

;; tree_logic__branch_type__m_variant__position_axiom
  (assert (<= 0 tree_logic__branch_type__m_variant__position1))

(declare-const tree_logic__branch_type__m_logical_address__first__bit1 Int)

(declare-const tree_logic__branch_type__m_logical_address__last__bit1 Int)

(declare-const tree_logic__branch_type__m_logical_address__position1 Int)

;; tree_logic__branch_type__m_logical_address__first__bit_axiom
  (assert (<= 0 tree_logic__branch_type__m_logical_address__first__bit1))

;; tree_logic__branch_type__m_logical_address__last__bit_axiom
  (assert
  (< tree_logic__branch_type__m_logical_address__first__bit1 tree_logic__branch_type__m_logical_address__last__bit1))

;; tree_logic__branch_type__m_logical_address__position_axiom
  (assert (<= 0 tree_logic__branch_type__m_logical_address__position1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ()
((branch_type__ref (branch_type__refqtmk (branch_type__content us_rep1)))))
(define-fun branch_type__ref_branch_type__content__projection ((a branch_type__ref)) us_rep1 
  (branch_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_183 us_rep2)
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool) (temp___do_typ_inv_182 Bool)) Bool (in_range4
  0
  (us_split_discrs1
  (rec__primitives__primitive_type__m_read_branch
  (us_split_fields5 temp___expr_183)))))

(define-fun default_initial_assumption ((temp___expr_186 us_rep2)
  (temp___skip_top_level_187 Bool)) Bool (and
                                         (= (rec__primitives__primitive_type__m_io_error
                                            (us_split_discrs3
                                            temp___expr_186)) (distinct 0 0))
                                         (= (to_rep1
                                            (rec__tree_logic__branch_type__m_variant
                                            (us_split_discrs1
                                            (rec__primitives__primitive_type__m_read_branch
                                            (us_split_fields5
                                            temp___expr_186))))) 0)))

(define-fun dynamic_invariant2 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 1)) (in_range2 temp___expr_158)))

(define-fun default_initial_assumption1 ((temp___expr_167 us_rep1)
  (temp___skip_top_level_168 Bool)) Bool (= (to_rep1
                                            (rec__tree_logic__branch_type__m_variant
                                            (us_split_discrs1
                                            temp___expr_167))) 0))

(declare-const usf Bool)

(declare-const usf1 us_rep2)

;; Ensures
  (assert
  (= (rec__primitives__primitive_type__m_io_error (us_split_discrs3 usf1)) 
  usf))

(assert
;; defqtvc
 ;; File "primitives.ads", line 3, characters 0-0
  (not (in_range2 0)))
(check-sat)