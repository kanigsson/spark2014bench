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

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 8))))))
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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

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

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep2 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep2 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort my_elem 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 8))

(declare-fun user_eq3 (my_elem my_elem) Bool)

(declare-const dummy3 my_elem)

(declare-datatypes ((my_elem__ref 0))
(((my_elem__refqtmk (my_elem__content my_elem)))))
(define-fun my_elem__ref_my_elem__content__projection ((a my_elem__ref)) my_elem 
  (my_elem__content a))

(declare-fun to_rep3 (my_elem) (_ BitVec 8))

(declare-fun of_rep3 ((_ BitVec 8)) my_elem)

;; inversion_axiom
  (assert
  (forall ((x my_elem))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep3 (of_rep3 x)) x) :pattern ((to_rep3 (of_rep3 x))) )))

(define-fun to_int2 ((x my_elem)) Int (bv2nat (to_rep3 x)))

;; range_int_axiom
  (assert
  (forall ((x my_elem)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int my_elem))))))
(declare-fun slide ((Array Int my_elem) Int Int) (Array Int my_elem))

;; slide_eq
  (assert
  (forall ((a (Array Int my_elem)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int my_elem)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int my_elem)) (a__first Int) (a__last Int)
  (b (Array Int my_elem)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep3 (select a temp___idx_155)) (to_rep3
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int my_elem)) (b (Array Int my_elem)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep3 (select a temp___idx_155)) (to_rep3
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int my_elem))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int my_elem) (elts a))

(define-fun of_array ((a (Array Int my_elem)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((element_array_type__ref 0))
(((element_array_type__refqtmk (element_array_type__content us_t)))))
(define-fun element_array_type__ref_element_array_type__content__projection ((a element_array_type__ref)) us_t 
  (element_array_type__content a))

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_t)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_t (t6b__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__foo__element_structure_type__max_size positive)))))
(define-fun us_split_discrs_rec__foo__element_structure_type__max_size__projection ((a us_split_discrs)) positive 
  (rec__foo__element_structure_type__max_size a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__foo__element_structure_type__index natural)(rec__foo__element_structure_type__items us_t)))))
(define-fun us_split_fields_rec__foo__element_structure_type__index__projection ((a us_split_fields)) natural 
  (rec__foo__element_structure_type__index a))

(define-fun us_split_fields_rec__foo__element_structure_type__items__projection ((a us_split_fields)) us_t 
  (rec__foo__element_structure_type__items a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__foo__element_structure_type__max_size
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__foo__element_structure_type__max_size
                                                  (us_split_discrs1 b))))
                        (and
                        (= (to_rep2
                           (rec__foo__element_structure_type__index
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__foo__element_structure_type__index
                                                  (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__foo__element_structure_type__items
                           (us_split_fields1 a))
                           (rec__foo__element_structure_type__items
                           (us_split_fields1 b))) true)))
                   true false))

(define-fun in_range3 ((rec__foo__element_structure_type__max_size1 Int)
  (a us_split_discrs)) Bool (= rec__foo__element_structure_type__max_size1 
  (to_rep (rec__foo__element_structure_type__max_size a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const foo__element_structure_type__max_size__first__bit Int)

(declare-const foo__element_structure_type__max_size__last__bit Int)

(declare-const foo__element_structure_type__max_size__position Int)

;; foo__element_structure_type__max_size__first__bit_axiom
  (assert (<= 0 foo__element_structure_type__max_size__first__bit))

;; foo__element_structure_type__max_size__last__bit_axiom
  (assert
  (< foo__element_structure_type__max_size__first__bit foo__element_structure_type__max_size__last__bit))

;; foo__element_structure_type__max_size__position_axiom
  (assert (<= 0 foo__element_structure_type__max_size__position))

(declare-const foo__element_structure_type__index__first__bit Int)

(declare-const foo__element_structure_type__index__last__bit Int)

(declare-const foo__element_structure_type__index__position Int)

;; foo__element_structure_type__index__first__bit_axiom
  (assert (<= 0 foo__element_structure_type__index__first__bit))

;; foo__element_structure_type__index__last__bit_axiom
  (assert
  (< foo__element_structure_type__index__first__bit foo__element_structure_type__index__last__bit))

;; foo__element_structure_type__index__position_axiom
  (assert (<= 0 foo__element_structure_type__index__position))

(declare-const foo__element_structure_type__items__first__bit Int)

(declare-const foo__element_structure_type__items__last__bit Int)

(declare-const foo__element_structure_type__items__position Int)

;; foo__element_structure_type__items__first__bit_axiom
  (assert (<= 0 foo__element_structure_type__items__first__bit))

;; foo__element_structure_type__items__last__bit_axiom
  (assert
  (< foo__element_structure_type__items__first__bit foo__element_structure_type__items__last__bit))

;; foo__element_structure_type__items__position_axiom
  (assert (<= 0 foo__element_structure_type__items__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((element_structure_type__ref 0))
(((element_structure_type__refqtmk (element_structure_type__content us_rep)))))
(define-fun element_structure_type__ref_element_structure_type__content__projection ((a element_structure_type__ref)) us_rep 
  (element_structure_type__content a))

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-sort byte 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 8))

(declare-fun user_eq6 (byte byte) Bool)

(declare-const dummy6 byte)

(declare-datatypes ((byte__ref 0))
(((byte__refqtmk (byte__content byte)))))
(define-fun byte__ref_byte__content__projection ((a byte__ref)) byte 
  (byte__content a))

(declare-fun to_rep4 (byte) (_ BitVec 8))

(declare-fun of_rep4 ((_ BitVec 8)) byte)

;; inversion_axiom
  (assert
  (forall ((x byte)) (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep4 (of_rep4 x)) x) :pattern ((to_rep4 (of_rep4 x))) )))

(define-fun to_int3 ((x byte)) Int (bv2nat (to_rep4 x)))

;; range_int_axiom
  (assert
  (forall ((x byte)) (! (uint_in_range (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int byte))))))
(declare-fun slide1 ((Array Int byte) Int Int) (Array Int byte))

;; slide_eq
  (assert
  (forall ((a (Array Int byte)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int byte)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq3 ((a (Array Int byte)) (a__first Int) (a__last Int)
  (b (Array Int byte)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep4 (select a temp___idx_154)) (to_rep4
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int byte)) (b (Array Int byte)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq3 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep4 (select a temp___idx_154)) (to_rep4
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tT9bP1 0)

(declare-fun tT9bP1qtint (tT9bP1) Int)

;; tT9bP1'axiom
  (assert
  (forall ((i tT9bP1)) (and (<= 1 (tT9bP1qtint i)) (<= (tT9bP1qtint i) 4))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (tT9bP1 tT9bP1) Bool)

(declare-const dummy7 tT9bP1)

(declare-datatypes ((tT9bP1__ref 0))
(((tT9bP1__refqtmk (tT9bP1__content tT9bP1)))))
(define-fun tT9bP1__ref_tT9bP1__content__projection ((a tT9bP1__ref)) tT9bP1 
  (tT9bP1__content a))

(declare-const dummy8 (Array Int my_elem))

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

(declare-fun user_eq8 ((Array Int my_elem) (Array Int my_elem)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__foo__element_structure_type__index1 natural)(rec__foo__element_structure_type__items1 (Array Int my_elem))))))
(define-fun us_split_fields_rec__foo__element_structure_type__index__2__projection ((a us_split_fields2)) natural 
  (rec__foo__element_structure_type__index1 a))

(define-fun us_split_fields_rec__foo__element_structure_type__items__2__projection ((a us_split_fields2)) (Array Int my_elem) 
  (rec__foo__element_structure_type__items1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (rec__foo__element_structure_type__index1
                                         (us_split_fields3 a))
                                         (of_array
                                         (rec__foo__element_structure_type__items1
                                         (us_split_fields3 a)) 1 4))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (rec__foo__element_structure_type__index
                                         (us_split_fields1 r))
                                         (let ((temp___156 (rec__foo__element_structure_type__items
                                                           (us_split_fields1
                                                           r))))
                                         (to_array temp___156)))))

(define-fun bool_eq4 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__foo__element_structure_type__max_size
                            (us_split_discrs2 a))) (to_rep
                                                   (rec__foo__element_structure_type__max_size
                                                   (us_split_discrs2 b))))
                         (and
                         (= (to_rep2
                            (rec__foo__element_structure_type__index1
                            (us_split_fields3 a))) (to_rep2
                                                   (rec__foo__element_structure_type__index1
                                                   (us_split_fields3 b))))
                         (= (bool_eq
                            (rec__foo__element_structure_type__items1
                            (us_split_fields3 a)) 1 4
                            (rec__foo__element_structure_type__items1
                            (us_split_fields3 b)) 1 4) true)))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const foo__element_structure_type__max_size__first__bit1 Int)

(declare-const foo__element_structure_type__max_size__last__bit1 Int)

(declare-const foo__element_structure_type__max_size__position1 Int)

;; foo__element_structure_type__max_size__first__bit_axiom
  (assert (<= 0 foo__element_structure_type__max_size__first__bit1))

;; foo__element_structure_type__max_size__last__bit_axiom
  (assert
  (< foo__element_structure_type__max_size__first__bit1 foo__element_structure_type__max_size__last__bit1))

;; foo__element_structure_type__max_size__position_axiom
  (assert (<= 0 foo__element_structure_type__max_size__position1))

(declare-const foo__element_structure_type__index__first__bit1 Int)

(declare-const foo__element_structure_type__index__last__bit1 Int)

(declare-const foo__element_structure_type__index__position1 Int)

;; foo__element_structure_type__index__first__bit_axiom
  (assert (<= 0 foo__element_structure_type__index__first__bit1))

;; foo__element_structure_type__index__last__bit_axiom
  (assert
  (< foo__element_structure_type__index__first__bit1 foo__element_structure_type__index__last__bit1))

;; foo__element_structure_type__index__position_axiom
  (assert (<= 0 foo__element_structure_type__index__position1))

(declare-const foo__element_structure_type__items__first__bit1 Int)

(declare-const foo__element_structure_type__items__last__bit1 Int)

(declare-const foo__element_structure_type__items__position1 Int)

;; foo__element_structure_type__items__first__bit_axiom
  (assert (<= 0 foo__element_structure_type__items__first__bit1))

;; foo__element_structure_type__items__last__bit_axiom
  (assert
  (< foo__element_structure_type__items__first__bit1 foo__element_structure_type__items__last__bit1))

;; foo__element_structure_type__items__position_axiom
  (assert (<= 0 foo__element_structure_type__items__position1))

(declare-fun user_eq9 (us_rep1 us_rep1) Bool)

(declare-const dummy9 us_rep1)

(declare-datatypes ((tstructureS__ref 0))
(((tstructureS__refqtmk (tstructureS__content us_rep1)))))
(define-fun tstructureS__ref_tstructureS__content__projection ((a tstructureS__ref)) us_rep1 
  (tstructureS__content a))

(declare-const structure__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_236 us_rep1)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (not (= temp___skip_constant_233 true))
                                     (in_range3 4
                                     (us_split_discrs1
                                     (to_base temp___expr_236)))))

(define-fun default_initial_assumption ((temp___expr_239 us_rep1)
  (temp___skip_top_level_240 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__foo__element_structure_type__max_size
                                            (us_split_discrs2
                                            temp___expr_239))) 4)
                                         (= (to_rep2
                                            (rec__foo__element_structure_type__index1
                                            (us_split_fields3
                                            temp___expr_239))) 1)))

(declare-sort tTstored_itemsSP1 0)

(declare-fun tTstored_itemsSP1qtint (tTstored_itemsSP1) Int)

;; tTstored_itemsSP1'axiom
  (assert
  (forall ((i tTstored_itemsSP1))
  (and (<= 1 (tTstored_itemsSP1qtint i)) (<= (tTstored_itemsSP1qtint i) 4))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq10 (tTstored_itemsSP1 tTstored_itemsSP1) Bool)

(declare-const dummy10 tTstored_itemsSP1)

(declare-datatypes ((tTstored_itemsSP1__ref 0))
(((tTstored_itemsSP1__refqtmk (tTstored_itemsSP1__content tTstored_itemsSP1)))))
(define-fun tTstored_itemsSP1__ref_tTstored_itemsSP1__content__projection ((a tTstored_itemsSP1__ref)) tTstored_itemsSP1 
  (tTstored_itemsSP1__content a))

(declare-fun temp_____aggregate_def_251 ((_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8) (_ BitVec 8)) (Array Int my_elem))

(declare-fun convert ((Array Int byte)) (Array Int my_elem))

;; convert__def
  (assert
  (forall ((a (Array Int byte)))
  (forall ((temp___260 Int))
  (= (to_rep4 (select a temp___260)) (to_rep3
                                     (select (convert a) temp___260))))))

(declare-fun convert1 ((Array Int my_elem)) (Array Int byte))

;; convert__def
  (assert
  (forall ((a (Array Int my_elem)))
  (forall ((temp___261 Int))
  (= (to_rep3 (select a temp___261)) (to_rep4
                                     (select (convert1 a) temp___261))))))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_189 (_ BitVec 8))
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool) (temp___do_typ_inv_188 Bool)) Bool true)

(define-fun dynamic_invariant5 ((temp___expr_202 (_ BitVec 8))
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool) (temp___do_typ_inv_201 Bool)) Bool true)

(define-fun dynamic_invariant6 ((temp___expr_209 us_t)
  (temp___is_init_205 Bool) (temp___skip_constant_206 Bool)
  (temp___do_toplevel_207 Bool)
  (temp___do_typ_inv_208 Bool)) Bool (=>
                                     (not (= temp___skip_constant_206 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_209)
                                     (last1 temp___expr_209))))

(define-fun dynamic_invariant7 ((temp___expr_215 us_rep)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (let ((temp___216 (rec__foo__element_structure_type__max_size
                                                       (us_split_discrs1
                                                       temp___expr_215))))
                                     (and (dynamic_property 1
                                     (to_rep temp___216)
                                     (first1
                                     (rec__foo__element_structure_type__items
                                     (us_split_fields1 temp___expr_215)))
                                     (last1
                                     (rec__foo__element_structure_type__items
                                     (us_split_fields1 temp___expr_215))))
                                     (and
                                     (= (first1
                                        (rec__foo__element_structure_type__items
                                        (us_split_fields1 temp___expr_215))) 1)
                                     (= (last1
                                        (rec__foo__element_structure_type__items
                                        (us_split_fields1 temp___expr_215))) 
                                     (to_rep temp___216))))))

;; def_axiom
  (assert
  (forall ((temp___253 (_ BitVec 8)) (temp___254 (_ BitVec 8))
  (temp___255 (_ BitVec 8)) (temp___256 (_ BitVec 8)))
  (let ((temp___252 (temp_____aggregate_def_251 temp___253 temp___254
                    temp___255 temp___256)))
  (=>
  (and
  (and (dynamic_invariant5 temp___253 true true true true)
  (dynamic_invariant5 temp___254 true true true true))
  (and (dynamic_invariant5 temp___255 true true true true)
  (dynamic_invariant5 temp___256 true true true true)))
  (and
  (and (= (to_rep3 (select temp___252 1)) temp___253)
  (= (to_rep3 (select temp___252 2)) temp___254))
  (and (= (to_rep3 (select temp___252 3)) temp___255)
  (= (to_rep3 (select temp___252 4)) temp___256)))))))

(assert
;; defqtvc
 ;; File "foo.adb", line 5, characters 0-0
  (not
  (forall ((usf Int) (usf1 us_rep))
  (=> (dynamic_invariant usf true true true true)
  (=>
  (= (to_rep
     (rec__foo__element_structure_type__max_size (us_split_discrs1 usf1))) usf)
  (=> (<= 1 usf) (<= 1 1)))))))
(check-sat)
(exit)
