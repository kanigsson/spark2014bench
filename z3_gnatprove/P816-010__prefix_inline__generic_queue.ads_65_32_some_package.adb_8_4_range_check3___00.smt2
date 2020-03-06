;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 Float32)))))
(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 8))

(declare-fun user_eq2 (index_type index_type) Bool)

(declare-const dummy2 index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(declare-fun to_rep2 (index_type) (_ BitVec 8))

(declare-fun of_rep2 ((_ BitVec 8)) index_type)

;; inversion_axiom
  (assert
  (forall ((x index_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep2 (of_rep2 x)) x) :pattern ((to_rep2 (of_rep2 x))) )))

(define-fun to_int2 ((x index_type)) Int (bv2int (to_rep2 x)))

;; range_int_axiom
  (assert
  (forall ((x index_type)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-sort mode_type 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (mode_type mode_type) Bool)

(declare-const dummy3 mode_type)

(declare-datatypes ()
((mode_type__ref (mode_type__refqtmk (mode_type__content mode_type)))))
(define-fun mode_type__ref_mode_type__content__projection ((a mode_type__ref)) mode_type 
  (mode_type__content a))

(declare-fun to_rep3 (mode_type) Int)

(declare-fun of_rep3 (Int) mode_type)

;; inversion_axiom
  (assert
  (forall ((x mode_type))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x mode_type)) (! (in_range3
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort element_type 0)

(define-fun in_range4 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b10000010 #b01000000000000000000000)))))

(declare-fun user_eq4 (element_type element_type) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE5 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Float32)

(declare-const dummy4 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(declare-fun to_rep4 (element_type) Float32)

(declare-fun of_rep4 (Float32) element_type)

;; inversion_axiom
  (assert
  (forall ((x element_type))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x element_type)) (! (in_range4
  (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (in_range4 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array (_ BitVec 8) element_type))))))
(declare-fun slide ((Array (_ BitVec 8) element_type) (_ BitVec 8)
  (_ BitVec 8)) (Array (_ BitVec 8) element_type))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 8) element_type)))
  (forall ((first (_ BitVec 8)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 8) element_type)))
  (forall ((old_first (_ BitVec 8)))
  (forall ((new_first (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 8) element_type))
  (a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b (Array (_ BitVec 8) element_type)) (b__first (_ BitVec 8))
  (b__last (_ BitVec 8))) Bool (ite (and
                                    (ite (bvule a__first a__last)
                                    (and (bvule b__first b__last)
                                    (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                    (bvugt b__first b__last))
                                    (forall ((temp___idx_155 (_ BitVec 8)))
                                    (=>
                                    (and (bvule a__first temp___idx_155)
                                    (bvule temp___idx_155 a__last))
                                    (fp.eq (to_rep4
                                           (select a temp___idx_155)) 
                                    (to_rep4
                                    (select b (bvadd (bvsub b__first a__first) temp___idx_155)))))))
                               true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 8) element_type))
  (b (Array (_ BitVec 8) element_type)))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_155 (_ BitVec 8)))
  (=> (and (bvule a__first temp___idx_155) (bvule temp___idx_155 a__last))
  (fp.eq (to_rep4 (select a temp___idx_155)) (to_rep4
                                             (select b (bvadd (bvsub b__first a__first) temp___idx_155)))))))))))

(declare-const dummy5 (Array (_ BitVec 8) element_type))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq5 ((Array (_ BitVec 8) element_type)
  (Array (_ BitVec 8) element_type)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__some_package__float_buffer__buffer_tag__mode mode_type)(rec__some_package__float_buffer__buffer_tag__buffer (Array (_ BitVec 8) element_type))(rec__some_package__float_buffer__buffer_tag__index_head index_type)(rec__some_package__float_buffer__buffer_tag__index_tail index_type)(rec__some_package__float_buffer__buffer_tag__haselements Bool)(rec__some_package__float_buffer__buffer_tag__num_overflows natural)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__some_package__float_buffer__buffer_tag__mode__projection ((a us_split_fields)) mode_type 
  (rec__some_package__float_buffer__buffer_tag__mode a))

(define-fun us_split_fields_rec__some_package__float_buffer__buffer_tag__buffer__projection ((a us_split_fields)) (Array (_ BitVec 8) element_type) 
  (rec__some_package__float_buffer__buffer_tag__buffer a))

(define-fun us_split_fields_rec__some_package__float_buffer__buffer_tag__index_head__projection ((a us_split_fields)) index_type 
  (rec__some_package__float_buffer__buffer_tag__index_head a))

(define-fun us_split_fields_rec__some_package__float_buffer__buffer_tag__index_tail__projection ((a us_split_fields)) index_type 
  (rec__some_package__float_buffer__buffer_tag__index_tail a))

(define-fun us_split_fields_rec__some_package__float_buffer__buffer_tag__haselements__projection ((a us_split_fields)) Bool 
  (rec__some_package__float_buffer__buffer_tag__haselements a))

(define-fun us_split_fields_rec__some_package__float_buffer__buffer_tag__num_overflows__projection ((a us_split_fields)) natural 
  (rec__some_package__float_buffer__buffer_tag__num_overflows a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep3
                           (rec__some_package__float_buffer__buffer_tag__mode
                           (us_split_fields1 a))) (to_rep3
                                                  (rec__some_package__float_buffer__buffer_tag__mode
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__some_package__float_buffer__buffer_tag__buffer
                           (us_split_fields1 a)) #x00 #xFF
                           (rec__some_package__float_buffer__buffer_tag__buffer
                           (us_split_fields1 b)) #x00 #xFF) true))
                        (and
                        (and
                        (= (to_rep2
                           (rec__some_package__float_buffer__buffer_tag__index_head
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__some_package__float_buffer__buffer_tag__index_head
                                                  (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__some_package__float_buffer__buffer_tag__index_tail
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__some_package__float_buffer__buffer_tag__index_tail
                                                  (us_split_fields1 b)))))
                        (and
                        (= (ite (rec__some_package__float_buffer__buffer_tag__haselements
                                (us_split_fields1 a)) 1 0) (ite (rec__some_package__float_buffer__buffer_tag__haselements
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep1
                           (rec__some_package__float_buffer__buffer_tag__num_overflows
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__some_package__float_buffer__buffer_tag__num_overflows
                                                  (us_split_fields1 b)))))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const some_package__float_buffer__buffer_tag__mode__first__bit Int)

(declare-const some_package__float_buffer__buffer_tag__mode__last__bit Int)

(declare-const some_package__float_buffer__buffer_tag__mode__position Int)

;; some_package__float_buffer__buffer_tag__mode__first__bit_axiom
  (assert (<= 0 some_package__float_buffer__buffer_tag__mode__first__bit))

;; some_package__float_buffer__buffer_tag__mode__last__bit_axiom
  (assert
  (< some_package__float_buffer__buffer_tag__mode__first__bit some_package__float_buffer__buffer_tag__mode__last__bit))

;; some_package__float_buffer__buffer_tag__mode__position_axiom
  (assert (<= 0 some_package__float_buffer__buffer_tag__mode__position))

(declare-const some_package__float_buffer__buffer_tag__buffer__first__bit Int)

(declare-const some_package__float_buffer__buffer_tag__buffer__last__bit Int)

(declare-const some_package__float_buffer__buffer_tag__buffer__position Int)

;; some_package__float_buffer__buffer_tag__buffer__first__bit_axiom
  (assert (<= 0 some_package__float_buffer__buffer_tag__buffer__first__bit))

;; some_package__float_buffer__buffer_tag__buffer__last__bit_axiom
  (assert
  (< some_package__float_buffer__buffer_tag__buffer__first__bit some_package__float_buffer__buffer_tag__buffer__last__bit))

;; some_package__float_buffer__buffer_tag__buffer__position_axiom
  (assert (<= 0 some_package__float_buffer__buffer_tag__buffer__position))

(declare-const some_package__float_buffer__buffer_tag__index_head__first__bit Int)

(declare-const some_package__float_buffer__buffer_tag__index_head__last__bit Int)

(declare-const some_package__float_buffer__buffer_tag__index_head__position Int)

;; some_package__float_buffer__buffer_tag__index_head__first__bit_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__index_head__first__bit))

;; some_package__float_buffer__buffer_tag__index_head__last__bit_axiom
  (assert
  (< some_package__float_buffer__buffer_tag__index_head__first__bit some_package__float_buffer__buffer_tag__index_head__last__bit))

;; some_package__float_buffer__buffer_tag__index_head__position_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__index_head__position))

(declare-const some_package__float_buffer__buffer_tag__index_tail__first__bit Int)

(declare-const some_package__float_buffer__buffer_tag__index_tail__last__bit Int)

(declare-const some_package__float_buffer__buffer_tag__index_tail__position Int)

;; some_package__float_buffer__buffer_tag__index_tail__first__bit_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__index_tail__first__bit))

;; some_package__float_buffer__buffer_tag__index_tail__last__bit_axiom
  (assert
  (< some_package__float_buffer__buffer_tag__index_tail__first__bit some_package__float_buffer__buffer_tag__index_tail__last__bit))

;; some_package__float_buffer__buffer_tag__index_tail__position_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__index_tail__position))

(declare-const some_package__float_buffer__buffer_tag__haselements__first__bit Int)

(declare-const some_package__float_buffer__buffer_tag__haselements__last__bit Int)

(declare-const some_package__float_buffer__buffer_tag__haselements__position Int)

;; some_package__float_buffer__buffer_tag__haselements__first__bit_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__haselements__first__bit))

;; some_package__float_buffer__buffer_tag__haselements__last__bit_axiom
  (assert
  (< some_package__float_buffer__buffer_tag__haselements__first__bit 
  some_package__float_buffer__buffer_tag__haselements__last__bit))

;; some_package__float_buffer__buffer_tag__haselements__position_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__haselements__position))

(declare-const some_package__float_buffer__buffer_tag__num_overflows__first__bit Int)

(declare-const some_package__float_buffer__buffer_tag__num_overflows__last__bit Int)

(declare-const some_package__float_buffer__buffer_tag__num_overflows__position Int)

;; some_package__float_buffer__buffer_tag__num_overflows__first__bit_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__num_overflows__first__bit))

;; some_package__float_buffer__buffer_tag__num_overflows__last__bit_axiom
  (assert
  (< some_package__float_buffer__buffer_tag__num_overflows__first__bit 
  some_package__float_buffer__buffer_tag__num_overflows__last__bit))

;; some_package__float_buffer__buffer_tag__num_overflows__position_axiom
  (assert
  (<= 0 some_package__float_buffer__buffer_tag__num_overflows__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((buffer_tag__ref (buffer_tag__refqtmk (buffer_tag__content us_rep)))))
(define-fun buffer_tag__ref_buffer_tag__content__projection ((a buffer_tag__ref)) us_rep 
  (buffer_tag__content a))

(define-fun default_initial_assumption ((temp___expr_227 us_rep)
  (temp___skip_top_level_228 Bool)) Bool (and
                                         (= (attr__tag temp___expr_227) 
                                         us_tag)
                                         (and
                                         (and
                                         (= (to_rep3
                                            (rec__some_package__float_buffer__buffer_tag__mode
                                            (us_split_fields1
                                            temp___expr_227))) 0)
                                         (forall ((temp___230 (_ BitVec 8)))
                                         (=>
                                         (and (bvule #x00 temp___230)
                                         (bvule temp___230 #xFF))
                                         (fp.eq (to_rep4
                                                (select (rec__some_package__float_buffer__buffer_tag__buffer
                                                        (us_split_fields1
                                                        temp___expr_227)) temp___230)) (fp #b0 #b00000000 #b00000000000000000000000)))))
                                         (and
                                         (and
                                         (= (to_rep2
                                            (rec__some_package__float_buffer__buffer_tag__index_head
                                            (us_split_fields1
                                            temp___expr_227))) #x00)
                                         (= (to_rep2
                                            (rec__some_package__float_buffer__buffer_tag__index_tail
                                            (us_split_fields1
                                            temp___expr_227))) #x00))
                                         (and
                                         (= (rec__some_package__float_buffer__buffer_tag__haselements
                                            (us_split_fields1
                                            temp___expr_227)) (distinct 0 0))
                                         (= (to_rep1
                                            (rec__some_package__float_buffer__buffer_tag__num_overflows
                                            (us_split_fields1
                                            temp___expr_227))) 0))))))

(declare-fun length1 (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-fun length2 (Int us_rep) Int)

(declare-fun length__function_guard1 (Int Int us_rep) Bool)

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 256))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 256)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (length_type length_type) Bool)

(declare-const dummy7 length_type)

(declare-datatypes ()
((length_type__ref (length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(define-fun dynamic_invariant ((temp___expr_195 Int)
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool)
  (temp___do_typ_inv_194 Bool)) Bool (=>
                                     (or (= temp___is_init_191 true)
                                     (<= 0 256)) (in_range5 temp___expr_195)))

;; length__post_axiom
  (assert
  (forall ((self us_rep)) (! (in_range5
  (length1 self)) :pattern ((length1 self)) )))

;; some_package__float_buffer__buffer_tag__compat_axiom
  (assert
  (forall ((self us_rep))
  (! (=> (length__function_guard1 (length2 us_tag self) us_tag self)
     (and
     (forall ((self1 us_rep)) (length__function_guard (length1 self1) self1))
     (= (length1 self) (length2 us_tag self)))) :pattern ((length2 us_tag
                                                          self)) )))

(declare-const self us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int element_type))))))
(declare-fun slide1 ((Array Int element_type) Int
  Int) (Array Int element_type))

;; slide_eq
  (assert
  (forall ((a (Array Int element_type)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int element_type)) (a__first Int)
  (a__last Int) (b (Array Int element_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (fp.eq (to_rep4 (select a temp___idx_154)) 
                           (to_rep4
                           (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int element_type)) (b (Array Int element_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (fp.eq (to_rep4 (select a temp___idx_154)) (to_rep4
                                             (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const elements__first integer)

(declare-const elements__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range5 low) (in_range5 high))))))

(declare-datatypes ()
((us_t (us_tqtmk (elts (Array Int element_type))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int element_type) (elts a))

(define-fun of_array ((a (Array Int element_type)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length3 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq3 ((x us_t)
  (y us_t)) Bool (bool_eq2 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq8 (us_t us_t) Bool)

(declare-const dummy8 us_t)

(declare-datatypes ()
((element_array__ref (element_array__refqtmk (element_array__content us_t)))))
(define-fun element_array__ref_element_array__content__projection ((a element_array__ref)) us_t 
  (element_array__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_202 us_t)
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool)
  (temp___do_typ_inv_201 Bool)) Bool (=>
                                     (not (= temp___skip_constant_199 true))
                                     (dynamic_property 0 256
                                     (first1 temp___expr_202)
                                     (last1 temp___expr_202))))

(define-fun dynamic_invariant4 ((temp___expr_208 Int)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (or (= temp___is_init_204 true)
                                     (<= 0 1)) (in_range3 temp___expr_208)))

(define-fun default_initial_assumption1 ((temp___expr_217 (Array (_ BitVec 8) element_type))
  (temp___skip_top_level_218 Bool)) Bool (forall ((temp___219 (_ BitVec 8)))
                                         (=>
                                         (and (bvule #x00 temp___219)
                                         (bvule temp___219 #xFF))
                                         (fp.eq (to_rep4
                                                (select temp___expr_217 temp___219)) (fp #b0 #b00000000 #b00000000000000000000000)))))

(define-fun dynamic_invariant5 ((temp___expr_181 (_ BitVec 8))
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool) (temp___do_typ_inv_180 Bool)) Bool true)

(define-fun dynamic_invariant6 ((temp___expr_188 Float32)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (or (= temp___is_init_184 true)
                                     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) (fp #b0 #b10000010 #b01000000000000000000000)))
                                     (in_range4 temp___expr_188)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_property 0 256 (to_rep elements__first)
  (to_rep elements__last)))

(define-fun o () us_rep self)

(define-fun o1 () Int (length1 o))

;; H
  (assert (length__function_guard o1 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep elements__last) o2))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep elements__first) o3))

(assert
;; defqtvc
 ;; File "generic_queue.ads", line 64, characters 0-0
  (not (in_range (length o3 o2))))
(check-sat)